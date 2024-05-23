output "arn" {
  description = "ARN of the Glue Catalog Database."
  value       = aws_glue_catalog_database.catalog_database.arn
}

output "id" {
  description = "Catalog ID and name of the database."
  value       = aws_glue_catalog_database.catalog_database.id
}

output "name" {
  #{"type":"string","default":"046692759124:catalog-test-database"}
  description = "Catalog ID and name of the database."
  value       = aws_glue_catalog_database.catalog_database.name
}