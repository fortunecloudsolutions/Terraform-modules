output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:table/catalog-test-database/catalog-test-table"}
  description = "The ARN of the Glue Table."
  value       = module.catalog_table.arn
}

output "id" {
  #{"type":"string","default":"046692759124:catalog-test-database:catalog-test-table"}
  description = "Catalog ID, Database name and of the name table."
  value       = module.catalog_table.id
}

output "name" {
  #{"type":"string","default":"catalog-test-table"}
  description =  "Name of the table."
  value       = module.catalog_table.name
}