output "arn" {
  #{"type":"string","default":"arn:aws:logs:us-east-2:046692759124:destination:test-cloudwatch-log-destination"}
  description = "The Amazon Resource Name (ARN) specifying the log destination."
  value       = module.cloudwatch_log_destination.arn
}

output "name" {
  #{"type":"string","default":"test-cloudwatch-log-destination"}
  description = "The Name specifying the log destination."
  value       = module.cloudwatch_log_destination.name
}

