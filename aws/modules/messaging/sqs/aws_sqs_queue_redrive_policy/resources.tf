resource "aws_sqs_queue_redrive_policy" "queue_redrive_policy" {
  queue_url = var.queue_url
  redrive_policy = var.redrive_policy
}