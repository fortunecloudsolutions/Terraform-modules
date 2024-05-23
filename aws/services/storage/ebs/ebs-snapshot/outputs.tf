output "snapshot_id" {
  #{"type":"string","default":"snap-61fcb34e"}
  description = "The snapshot ID (e.g. snap-59fcb34e)."
  value       = module.snapshot.snapshot_id
}
output "snapshot_arn" {
  #{"type":"string","default":"arn:aws:ec2:us-east-1:0123456789012:volume/vol-59fcb34e"}
  description = "Amazon Resource Name (ARN) of the EBS Snapshot."
  value       = module.snapshot.snapshot_arn
}
