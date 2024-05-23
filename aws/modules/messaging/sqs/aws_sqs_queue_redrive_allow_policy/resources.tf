resource "aws_sqs_queue_redrive_allow_policy" "sqs_queue_redrive_allow_policy" {
  queue_url = var.queue_url
  redrive_allow_policy = var.redrive_allow_policy
}