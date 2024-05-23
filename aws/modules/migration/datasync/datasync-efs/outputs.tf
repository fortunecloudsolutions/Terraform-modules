output "datasync_efs_arn" {
  #{"type":"string","default":"arn:aws:datasync:us-east-2:111222333444:location/loc-07db7abfc326c50fb"}
  description = "Amazon Resource Name (ARN) of the DataSync Agent."
  value       = aws_datasync_location_efs.efs.arn
}