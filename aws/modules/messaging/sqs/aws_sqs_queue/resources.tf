resource "aws_sqs_queue" "terraform_queue" {
  name                              = var.name
  name_prefix                       = var.name_prefix
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  delay_seconds                     = var.delay_seconds
  max_message_size                  = var.max_message_size
  message_retention_seconds         = var.message_retention_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  policy                            = var.policy
  redrive_policy                    = var.redrive_policy
  # redrive_allow_policy              = var.redrive_allow_policy
  fifo_queue                        = var.fifo_queue
  content_based_deduplication       = var.content_based_deduplication
  # sqs_managed_sse_enabled           = var.sqs_managed_sse_enabled
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  deduplication_scope               = var.deduplication_scope
  fifo_throughput_limit             = var.fifo_throughput_limit
  tags                              = var.tags

}