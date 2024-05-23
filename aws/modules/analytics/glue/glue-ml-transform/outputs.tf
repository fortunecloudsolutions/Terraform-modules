output "arn" {
  description = "Amazon Resource Name (ARN) of Glue ML Transform."
  value       = aws_glue_ml_transform.ml_transform.arn
}

output "id" {
  description = "Amazon Resource Name (ARN) of Glue ML Transform."
  value       = aws_glue_ml_transform.ml_transform.id
}

output "label_count" {
  description = "The number of labels available for this transform."
  value       = aws_glue_ml_transform.ml_transform.label_count
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_glue_ml_transform.ml_transform.tags_all
}

output "schema" {
  description = "Amazon Resource Name (ARN) of Glue ML Transform."
  value       = aws_glue_ml_transform.ml_transform.schema
}

/* output "name" {
  description = "The name of the column."
  value       = aws_glue_ml_transform.ml_transform.name
}

output "data_type" {
  description = "The type of data in the column."
  value       = aws_glue_ml_transform.ml_transform.data_type
} */
