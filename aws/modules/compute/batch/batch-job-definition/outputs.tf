output "arn" {
  description = "The Amazon Resource Name of the job definition."
  value       = aws_batch_job_definition.job_definition.arn
}

output "revision" {
  description = "The revision of the job definition."
  value       = aws_batch_job_definition.job_definition.revision
}

output "tags_all" {
  description = "The Amazon Resource Name of the job definition."
  value       = aws_batch_job_definition.job_definition.tags_all
}

