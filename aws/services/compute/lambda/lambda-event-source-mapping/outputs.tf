output "function_arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:function:test-lambda-function"}
  description = "The the ARN of the Lambda function the event source mapping is sending events to. (Note: this is a computed value that differs from function_name above.)"
  value       = module.lambda_event_source_mapping.function_arn
}

output "last_modified" {
  #{"type":"string","default":"2021-09-15T01:46:01Z"}
  description = "The date this resource was last modified."
  value       = module.lambda_event_source_mapping.last_modified
}

output "last_processing_result" {
  #{"type":"string","default":"dummy"}
  description = "The result of the last AWS Lambda invocation of your Lambda function."
  value       = module.lambda_event_source_mapping.last_processing_result
}

output "state" {
  #{"type":"string","default":"Enabled"}
  description = "The state of the event source mapping."
  value       = module.lambda_event_source_mapping.state
}

output "state_transition_reason" {
  #{"type":"string","default":"USER_INITIATED"}
  description = "The reason the event source mapping is in its current state."
  value       = module.lambda_event_source_mapping.state_transition_reason
}

output "uuid" {
  #{"type":"string","default":"7d2a4611-9c6f-4197-94b3-b401722a484a"}
  description = "The UUID of the created event source mapping."
  value       = module.lambda_event_source_mapping.uuid
}
