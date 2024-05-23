output "efs_id" {
  #{"type":"string","default":"fs-ccfc0d65"}
  description = "The ID of the mount target"
  value       = module.efs.efs_id
}

output "efs_dns_name" {
  #{"type":"string","default":"dns-efs"}
  description = "The DNS name for the EFS file system."
  value       = module.efs.efs_dns_name
}