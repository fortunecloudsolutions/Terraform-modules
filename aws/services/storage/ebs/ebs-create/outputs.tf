output "volume_id" {
  #{"type":"string","default":["vol-59fcb34e"]}
  description = "The volume ID (e.g. vol-59fcb34e)"
  value       = module.volume.volume_id
}
output "volume_arn" {
  #{"type":"string","default":["arn:aws:ec2:us-east-1:0123456789012:volume/vol-59fcb34e"]}
  description = "The volume ARN (e.g. arn:aws:ec2:us-east-1:0123456789012:volume/vol-59fcb34e)."
  value       = module.volume.volume_arn
}
output "availability_zone" {
  #{"type":"string","default":"us-east-2a"}
  description = "The availability_zone in which the ebs volume is created"
  value       = module.volume.availability_zone
}