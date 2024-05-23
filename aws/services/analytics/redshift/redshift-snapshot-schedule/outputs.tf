output "arn" {
  #{"type":"string","default":"arn:aws:redshift:us-east-2:046692759124:snapshotschedule:terraform-20210614185519939200000001"}
  description = "Amazon Resource Name (ARN) of the Redshift Snapshot Schedule."
  value       = module.snapshot_schedule.arn
}

output "id" {
  #{"type":"string","default":"terraform-20210614191056813500000001"}
  description = "Amazon Resource Name (ARN) of the Redshift Snapshot Schedule."
  value       = module.snapshot_schedule.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.snapshot_schedule.tags_all
}