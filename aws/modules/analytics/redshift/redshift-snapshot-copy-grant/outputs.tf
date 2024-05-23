output "arn" {
  description = "Amazon Resource Name (ARN) of snapshot copy grant"
  value       = aws_redshift_snapshot_copy_grant.snapshot_copy_grant.arn
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_redshift_snapshot_copy_grant.snapshot_copy_grant.tags_all
}