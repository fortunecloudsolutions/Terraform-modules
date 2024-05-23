output "id" {
  description = "The name of the DynamoDB Global Table"
  value       = aws_dynamodb_global_table.global_table.id
}

output "arn" {
  description = "The ARN of the DynamoDB Global Table"
  value       = aws_dynamodb_global_table.global_table.arn
}