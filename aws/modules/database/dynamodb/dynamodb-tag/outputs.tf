output "id" {
  description = "DynamoDB resource identifier and key, separated by a comma (,)"
  value       = aws_dynamodb_tag.dynamodb_tag.id
}
