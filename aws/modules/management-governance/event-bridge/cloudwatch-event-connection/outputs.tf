output "arn" {
  description = "The Amazon Resource Name (ARN) of the connection."
  value       = aws_cloudwatch_event_connection.event_connection.arn
}

output "secret_arn" {
  description = "The Amazon Resource Name (ARN) of the secret created from the authorization parameters specified for the connection."
  value       = aws_cloudwatch_event_connection.event_connection.secret_arn
}
