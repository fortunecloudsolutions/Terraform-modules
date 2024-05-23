output "id" {
  description = "Catalog ID and name of the connection."
  value       = aws_glue_connection.connection.id
}

output "arn" {
  description = "The ARN of the Glue Connection."
  value       = aws_glue_connection.connection.arn
}

