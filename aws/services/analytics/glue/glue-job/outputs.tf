output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:job/test-job"}
  description = "Amazon Resource Name (ARN) of Glue Job"
  value       = module.job.arn
}

output "id" {
  #{"type":"string","default":"test-job"}
  description = "Job name"
  value       = module.job.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.job.tags_all
}