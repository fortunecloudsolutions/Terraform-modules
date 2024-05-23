output "id" {
  #{"type":"string","default":"test-policy"}
  description = "The name of the CloudWatch log resource policy"
  value       = module.cloudwatch_log_resource_policy.id
}


