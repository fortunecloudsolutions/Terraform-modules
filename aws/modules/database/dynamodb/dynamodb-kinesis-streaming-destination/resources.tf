resource "aws_dynamodb_kinesis_streaming_destination" "kinesis_streaming_destination" {
  stream_arn = var.stream_arn
  table_name = var.table_name
}