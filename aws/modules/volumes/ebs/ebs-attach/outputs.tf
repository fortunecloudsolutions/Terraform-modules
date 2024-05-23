output "volume_id" {
  description = "ID of the Volume"
  value       = aws_volume_attachment.ebs_att.volume_id
}
output "instance_id" {
  description = "ID of the Instance"
  value       = aws_volume_attachment.ebs_att.instance_id
}
output "device_name" {
  description = "The device name exposed to the instance"
  value       = aws_volume_attachment.ebs_att.device_name
}