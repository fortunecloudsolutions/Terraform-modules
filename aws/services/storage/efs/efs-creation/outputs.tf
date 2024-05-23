output "efs_id" {
  #{"type":"string","default":"fs-ccfc0d65"}
  description = "The ID that identifies the file system (e.g. fs-ccfc0d65)"
  value       = module.efs.efs_id
}

output "efs_arn" {
  #{"type":"string","default":"arn:aws:elasticfilesystem:us-east-2:123412341234:file-system/fs-d1188b58"}
  description = "Amazon Resource Name of the file system."
  value       = module.efs.efs_arn
}