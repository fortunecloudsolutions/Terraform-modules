output "function_arn" {
  description = "The the ARN of the Lambda function the event source mapping is sending events to. (Note: this is a computed value that differs from function_name above.)"
  value       = aws_lambda_event_source_mapping.lambda_event_source_mapping.function_arn
}

output "last_modified" {
  description = "The date this resource was last modified."
  value       = aws_lambda_event_source_mapping.lambda_event_source_mapping.last_modified
}

output "last_processing_result" {
  description = "The result of the last AWS Lambda invocation of your Lambda function."
  value       = aws_lambda_event_source_mapping.lambda_event_source_mapping.last_processing_result
}

output "state" {
  description = "The state of the event source mapping."
  value       = aws_lambda_event_source_mapping.lambda_event_source_mapping.state
}

output "state_transition_reason" {
  description = "The reason the event source mapping is in its current state."
  value       = aws_lambda_event_source_mapping.lambda_event_source_mapping.state_transition_reason
}

output "uuid" {
  description = "The UUID of the created event source mapping."
  value       = aws_lambda_event_source_mapping.lambda_event_source_mapping.uuid
}
