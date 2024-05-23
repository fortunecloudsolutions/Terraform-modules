output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:database/catalog-test-database"}
  description = "ARN of the Glue Catalog Database."
  value       = module.catalog_database.arn
}

output "id" {
  #{"type":"string","default":"046692759124:catalog-test-database"}
  description = "Catalog ID and name of the database."
  value       = module.catalog_database.id
}

output "name" {
  #{"type":"string","default":"catalog-test-database"}
  description = "Catalog ID and name of the database."
  value       = module.catalog_database.name
}
