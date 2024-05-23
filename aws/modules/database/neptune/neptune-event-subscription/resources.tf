resource "aws_neptune_event_subscription" "event_subscription" {
  name             = var.name
  name_prefix      = var.name_prefix
  sns_topic_arn    = var.sns_topic_arn
  enabled          = var.enabled
  source_type      = var.source_type
  source_ids       = var.source_ids
  event_categories = var.event_categories
  tags             = var.tags
  timeouts {
    create = lookup(var.timeouts, "create", "40m")
    update = lookup(var.timeouts, "update", "40m")
    delete = lookup(var.timeouts, "delete", "40m")
  }
}