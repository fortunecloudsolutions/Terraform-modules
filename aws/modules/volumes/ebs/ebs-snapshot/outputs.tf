output "snapshot_id" {
  #{"type":"string","default":"snap-59fcb34e"}
  description = "The snapshot ID (e.g. snap-59fcb34e)."
  value       = aws_ebs_snapshot.snapshot.id
}
output "snapshot_arn" {
  description = "Amazon Resource Name (ARN) of the EBS Snapshot."
  value       = aws_ebs_snapshot.snapshot.arn
}