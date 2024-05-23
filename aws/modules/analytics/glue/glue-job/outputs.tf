output "arn" {
  description = "Amazon Resource Name (ARN) of Glue Job"
  value       = aws_glue_job.job.arn
}

output "id" {
  description = "Job name"
  value       = aws_glue_job.job.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_glue_job.job.tags_all
}