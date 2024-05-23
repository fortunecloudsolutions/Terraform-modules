output "datasync_nfs_arn" {
  #{"type":"string","default":"arn:aws:datasync:us-west-2:111222333444:location/loc-07db7abfc326c50fb"}
  description = "Amazon Resource Name (ARN) of the DataSync Location."
  value       = module.datasync_nfs.datasync_nfs_arn
}