resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.bucket

  dynamic "topic" {
    for_each = var.topic != null ? var.topic : []
    content {
      id            = lookup(topic.value, "id", null)
      topic_arn     = lookup(topic.value, "topic_arn")
      events        = lookup(topic.value, "events")
      filter_prefix = lookup(topic.value, "filter_prefix", null)
      filter_suffix = lookup(topic.value, "filter_suffix", null)
    }
  }

  dynamic "queue" {
    for_each = var.queue != null ? var.queue : []
    content {
      id            = lookup(queue.value, "id", null)
      queue_arn     = lookup(queue.value, "queue_arn")
      events        = lookup(queue.value, "events")
      filter_prefix = lookup(queue.value, "filter_prefix", null)
      filter_suffix = lookup(queue.value, "filter_suffix", null)
    }
  }

  dynamic "lambda_function" {
    for_each = var.lambda_function != null ? var.lambda_function : []
    content {
      id                  = lookup(lambda_function.value, "id", null)
      lambda_function_arn = lookup(lambda_function.value, "lambda_function_arn")
      events              = lookup(lambda_function.value, "events")
      filter_prefix       = lookup(lambda_function.value, "filter_prefix", null)
      filter_suffix       = lookup(lambda_function.value, "filter_suffix", null)
    }
  }


}
