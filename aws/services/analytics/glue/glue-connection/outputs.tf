output "id" {
  #{"type":"string","default":"046692759124:catalog-test-connection"}
  description = "Catalog ID and name of the connection."
  value       = module.connection.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:connection/catalog-test-connection"}
  description = "The ARN of the Glue Connection."
  value       = module.connection.arn
}

