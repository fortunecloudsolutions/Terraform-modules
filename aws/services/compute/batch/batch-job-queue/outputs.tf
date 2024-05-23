output "arn" {
  #{"type":"string","default":"arn:aws:batch:us-east-2:046692759124:job-queue/test-job-queue"}
  description = "The Amazon Resource Name of the job queue."
  value       = module.job_queue.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.job_queue.tags_all
}