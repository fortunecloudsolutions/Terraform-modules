output "arn" {
  #{"type":"string","default":"arn:aws:logs:us-east-2:046692759124:log-group:test-cloudwatch-log-group:log-stream:test-log-stream"}
  description = "The name of the CloudWatch log resource policy"
  value       = module.cloudwatch_log_stream.arn
}


