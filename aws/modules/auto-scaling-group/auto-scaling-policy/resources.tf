resource "aws_autoscaling_policy" "asg_policy" {
  name                   = var.policy_name
  autoscaling_group_name = var.autoscaling_group_name
  adjustment_type        = var.adjustment_type
  policy_type            = var.policy_type

  estimated_instance_warmup = (var.policy_type == "StepScaling" ||
    var.policy_type == "TargetTrackingScaling" || var.policy_type == null ?
  var.instance_contribute_cooldown_cloudmetric : null)

  min_adjustment_magnitude = (var.policy_type == "SimpleScaling" ||
    var.policy_type == "StepScaling" || var.policy_type == null ?
  var.min_adjustment_magnitude : null)

  cooldown = (var.policy_type == "SimpleScaling" || var.policy_type == null ?
  var.cooldown : null)
  scaling_adjustment = (var.policy_type == "SimpleScaling" || var.policy_type == null ?
  var.scaling_adjustment : null)

  metric_aggregation_type = (var.policy_type == "StepScaling" ?
  var.metric_aggregation_type : null)

  dynamic "step_adjustment" {
    for_each = var.step_adjustment != null && var.policy_type == "StepScaling" ? var.step_adjustment : []
    content {
      scaling_adjustment          = lookup(step_adjustment.value, "scaling_adjustment", null)
      metric_interval_lower_bound = lookup(step_adjustment.value, "metric_interval_lower_bound", null)
      metric_interval_upper_bound = lookup(step_adjustment.value, "metric_interval_upper_bound", null)
    }
  }

  dynamic "target_tracking_configuration" {
    for_each = (var.predefined_metric_specification != null && var.policy_type == "TargetTrackingScaling" ?
    [var.predefined_metric_specification] : [])
    content {
      predefined_metric_specification {
        predefined_metric_type = lookup(target_tracking_configuration.value, "predefined_metric_type")
        resource_label         = lookup(target_tracking_configuration.value, "resource_label", null)
      }

      target_value     = lookup(target_tracking_configuration.value, "target_value")
      disable_scale_in = lookup(target_tracking_configuration.value, "disable_scale_in", false)

    }
  }

  dynamic "target_tracking_configuration" {
    for_each = (var.customized_metric_specification != null && var.policy_type == "TargetTrackingScaling" ?
    [var.customized_metric_specification] : [])
    content {
      customized_metric_specification {

        dynamic "metric_dimension" {
          for_each = (lookup(target_tracking_configuration.value, "metric_dimension", null) != null ?
          lookup(target_tracking_configuration.value, "metric_dimension") : [])
          content {
            name  = lookup(metric_dimension.value, "name", null).name
            value = lookup(metric_dimension.value, "value", null).value
          }
        }

        metric_name = lookup(target_tracking_configuration.value, "metric_name")
        namespace   = lookup(target_tracking_configuration.value, "namespace")
        statistic   = lookup(target_tracking_configuration.value, "statistic")
        unit        = lookup(target_tracking_configuration.value, "unit", null)
      }

      target_value     = lookup(target_tracking_configuration.value, "target_value")
      disable_scale_in = lookup(target_tracking_configuration.value, "disable_scale_in", false)

    }
  }
}