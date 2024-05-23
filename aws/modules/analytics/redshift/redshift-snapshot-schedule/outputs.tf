output "arn" {
  description = "Amazon Resource Name (ARN) of the Redshift Snapshot Schedule."
  value       = aws_redshift_snapshot_schedule.snapshot_schedule.arn
}

output "id" {
  description = "Amazon Resource Name (ARN) of the Redshift Snapshot Schedule."
  value       = aws_redshift_snapshot_schedule.snapshot_schedule.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_redshift_snapshot_schedule.snapshot_schedule.tags_all
}