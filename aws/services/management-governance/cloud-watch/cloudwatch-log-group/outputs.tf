output "arn" {
  #{"type":"string","default":"arn:aws:logs:us-east-2:046692759124:log-group:test-cloudwatch-log-group"}
  description = "The Amazon Resource Name (ARN) specifying the log group. Any :* suffix added by the API, denoting all CloudWatch Log Streams under the CloudWatch Log Group, is removed for greater compatibility with other AWS services that do not accept the suffix."
  value       = module.cloudwatch_log_group.arn
}

output "name" {
  #{"type":"string","default":"test-cloudwatch-log-group"}
  description = "The Amazon Resource Name (ARN) specifying the log group. Any :* suffix added by the API, denoting all CloudWatch Log Streams under the CloudWatch Log Group, is removed for greater compatibility with other AWS services that do not accept the suffix."
  value       = module.cloudwatch_log_group.name
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cloudwatch_log_group.tags_all
}
