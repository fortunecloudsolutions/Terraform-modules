output "efs_id" {
  description = "The ID that identifies the file system (e.g. fs-ccfc0d65)"
  value       = aws_efs_mount_target.efs.id
}

output "efs_dns_name" {
  description = "The DNS name for the EFS file system."
  value       = aws_efs_mount_target.efs.dns_name
}