output "arn" {
  #{"type":"string","default":"arn:aws:batch:us-east-2:046692759124:job-definition/test-job-definition:1"}
  description = "The Amazon Resource Name of the job definition."
  value       = module.job_definition.arn
}

output "revision" {
  #{"type":"number","default":"1"}
  description = "The revision of the job definition."
  value       = module.job_definition.revision
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "The Amazon Resource Name of the job definition."
  value       = module.job_definition.tags_all
}

