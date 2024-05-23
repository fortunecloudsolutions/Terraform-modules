output "arn" {
  description = "The ARN of the Glue Table."
  value       = aws_glue_catalog_table.catalog_table.arn
}

output "id" {
  description = "Catalog ID, Database name and of the name table."
  value       = aws_glue_catalog_table.catalog_table.id
}

output "name" {
  description = "Name of the table"
  value       = aws_glue_catalog_table.catalog_table.name
}