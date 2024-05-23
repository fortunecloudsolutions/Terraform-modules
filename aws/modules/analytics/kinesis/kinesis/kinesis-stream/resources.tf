resource "aws_kinesis_stream" "kinesis_stream" {
  name                      = var.name
  shard_count               = var.shard_count
  retention_period          = var.retention_period
  shard_level_metrics       = var.shard_level_metrics
  tags                      = var.tags
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  kms_key_id                = var.kms_key_id

  timeouts {
    create = lookup(var.timeouts, "create", "5m")
    update = lookup(var.timeouts, "update", "120m")
    delete = lookup(var.timeouts, "delete", "120m")
  }
}