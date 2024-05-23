output "arn" {
  #{"type":"string","default":"arn:aws:redshift:us-east-2:046692759124:snapshotcopygrant:test-snapshot-copy-grant-name-test-cluster"}
  description = "Amazon Resource Name (ARN) of snapshot copy grant"
  value       = module.snapshot_copy_grant.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.snapshot_copy_grant.tags_all
}