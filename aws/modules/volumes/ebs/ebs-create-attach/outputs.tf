output "volume_id" {
  description = "The volume ID (e.g. vol-59fcb34e)"
  value       = aws_ebs_volume.ebs.id
}
output "volume_arn" {
  description = "The volume ARN (e.g. arn:aws:ec2:us-east-1:0123456789012:volume/vol-59fcb34e)."
  value       = aws_ebs_volume.ebs.arn
}
output "availability_zone" {
  description = "The availability_zone in which the ebs volume is created"
  value       = aws_ebs_volume.ebs.availability_zone
}
