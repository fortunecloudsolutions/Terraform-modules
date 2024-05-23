locals {
  tag_pairs = var.tags
}

resource "aws_autoscaling_group" "asg" {

  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  default_cooldown          = var.default_cooldown
  launch_configuration      = var.launch_template != null ? null : (var.launch_configuration != null ? var.launch_configuration : null)
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  # Load Balancers are only valid for Classic ELB, for ALB or NLB input target_group_arns
  load_balancers            = var.elb_load_balancers
  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = var.target_group_arns
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  placement_group           = var.placement_group
  metrics_granularity       = var.metrics_granularity
  enabled_metrics           = var.enabled_metrics
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  max_instance_lifetime     = var.max_instance_lifetime

  dynamic "initial_lifecycle_hook" {
    for_each = var.initial_lifecycle_hook != null ? [var.initial_lifecycle_hook] : []
    content {
      name                    = lookup(initial_lifecycle_hook.value, "name")
      default_result          = lookup(initial_lifecycle_hook.value, "default_result", "ABANDON")
      heartbeat_timeout       = lookup(initial_lifecycle_hook.value, "heartbeat_timeout", "3600")
      lifecycle_transition    = lookup(initial_lifecycle_hook.value, "lifecycle_transition")
      notification_metadata   = lookup(initial_lifecycle_hook.value, "notification_metadata")
      notification_target_arn = lookup(initial_lifecycle_hook.value, "notification_target_arn")
      role_arn                = lookup(initial_lifecycle_hook.value, "role_arn")
    }
  }

  dynamic "launch_template" {
    for_each = var.launch_template != null && var.mixed_instances_policy == null ? [var.launch_template] : []
    content {
      id      = lookup(launch_template.value, "id")
      version = lookup(launch_template.value, "version")
    }
  }

  dynamic "mixed_instances_policy" {
    for_each = var.mixed_instances_policy != null ? [var.mixed_instances_policy] : []
    content {
      dynamic "instances_distribution" {
        for_each = mixed_instances_policy.value.instances_distribution != null ? [mixed_instances_policy.value.instances_distribution] : []
        content {
          on_demand_allocation_strategy            = lookup(instances_distribution.value, "on_demand_allocation_strategy", "prioritized")
          on_demand_base_capacity                  = lookup(instances_distribution.value, "on_demand_base_capacity", "0")
          on_demand_percentage_above_base_capacity = lookup(instances_distribution.value, "on_demand_percentage_above_base_capacity", "100")
          spot_allocation_strategy                 = lookup(instances_distribution.value, "spot_allocation_strategy", "lowest-price")
          spot_instance_pools                      = lookup(instances_distribution.value, "spot_instance_pools", "2")
          spot_max_price                           = lookup(instances_distribution.value, "spot_max_price", "")
        }
      }

      launch_template {
        dynamic "launch_template_specification" {
          for_each = var.launch_template != null ? [var.launch_template] : []
          content {
            launch_template_id = lookup(launch_template_specification.value, "id")
            version            = lookup(launch_template_specification.value, "version")
          }
        }

        dynamic "override" {
          for_each = mixed_instances_policy.value.override != null ? mixed_instances_policy.value.override : []
          content {
            instance_type     = lookup(override.value, "instance_type", null)
            weighted_capacity = lookup(override.value, "weighted_capacity", null)
          }
        }
      }
    }
  }

  tags = flatten([
    for key in keys(local.tag_pairs) :
    {
      key                 = key
      value               = local.tag_pairs[key]
      propagate_at_launch = true
    }
  ])

  lifecycle {
    create_before_destroy = true
  }
}