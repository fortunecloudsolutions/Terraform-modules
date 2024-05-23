resource "aws_dms_event_subscription" "event_subscription" {
  name             = var.name
  enabled          = var.enabled
  event_categories = var.event_categories
  source_type      = var.source_type
  source_ids       = var.source_ids
  sns_topic_arn    = var.sns_topic_arn
}