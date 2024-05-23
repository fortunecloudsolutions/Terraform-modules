resource "aws_cloudwatch_metric_stream" "cloudwatch_metric_stream" {
  name          = var.name
  role_arn      = var.role_arn
  firehose_arn  = var.firehose_arn
  output_format = var.output_format
  name_prefix   = var.name_prefix
  tags          = var.tags
  dynamic "exclude_filter" {
    for_each = var.exclude_filter != null ? var.exclude_filter : []
    content {
      namespace = lookup(exclude_filter.value, "namespace")
    }
  }
  dynamic "include_filter" {
    for_each = var.include_filter != null ? var.include_filter : []
    content {
      namespace = lookup(include_filter.value, "namespace")
    }
  }

}
