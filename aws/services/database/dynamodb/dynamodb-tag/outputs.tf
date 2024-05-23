output "id" {
  #{"type":"string","default":"arn:aws:dynamodb:us-east-2:046692759124:table/test-table,key1"}
  description = "DynamoDB resource identifier and key, separated by a comma (,)"
  value       = module.dynamodb_tag.id
}
