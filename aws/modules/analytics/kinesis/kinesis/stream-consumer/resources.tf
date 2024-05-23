resource "aws_kinesis_stream_consumer" "stream_consumer" {
  name       = var.name
  stream_arn = var.stream_arn
}