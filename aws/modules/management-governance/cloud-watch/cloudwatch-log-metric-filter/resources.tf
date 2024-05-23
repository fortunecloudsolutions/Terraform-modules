resource "aws_cloudwatch_log_metric_filter" "cloudwatch_log_metric_filter" {
  name           = var.name
  pattern        = var.pattern
  log_group_name = var.log_group_name

  dynamic "metric_transformation" {
    for_each = var.metric_transformation != null ? [var.metric_transformation] : []
    content {
      name          = lookup(metric_transformation.value, "name")
      namespace     = lookup(metric_transformation.value, "namespace")
      value         = lookup(metric_transformation.value, "value")
      default_value = lookup(metric_transformation.value, "default_value", null)
      dimensions    = lookup(metric_transformation.value, "dimensions", null)
      unit          = lookup(metric_transformation.value, "unit", null)

    }
  }

}
