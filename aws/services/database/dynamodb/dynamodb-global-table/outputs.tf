output "id" {
  #{"type":"string","default":"test-table"}
  description = "The name of the DynamoDB Global Table"
  value       = module.global_table.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:dynamodb::046692759124:global-table/test-table"}
  description = "The ARN of the DynamoDB Global Table"
  value       = module.global_table.arn
}