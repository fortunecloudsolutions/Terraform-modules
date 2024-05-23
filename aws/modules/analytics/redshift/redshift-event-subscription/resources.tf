resource "aws_redshift_event_subscription" "event_subscription" {
  name             = var.name
  sns_topic_arn    = var.sns_topic_arn
  source_type      = var.source_type
  source_ids       = var.source_ids
  severity         = var.severity
  event_categories = var.event_categories
  enabled          = var.enabled
  tags             = var.tags
}