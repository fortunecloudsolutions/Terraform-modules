output "arn" {
  description = "ARN of the AMI."
  value       = aws_ami.example.arn
}

output "id" {
  description = "ID of the created AMI."
  value       = aws_ami.example.id
}

output "root_snapshot_id" {
  description = "Snapshot ID for the root volume (for EBS-backed AMIs)"
  value       = aws_ami.example.root_snapshot_id
}

output "owner_id" {
  description = "AWS account ID of the image owner."
  value       = aws_ami.example.owner_id
}

output "usage_operation" {
  description = "Operation of the Amazon EC2 instance and the billing code that is associated with the AMI."
  value       = aws_ami.example.usage_operation
}

output "platform_details" {
  description = "Platform details associated with the billing code of the AMI."
  value       = aws_ami.example.platform_details
}

output "image_owner_alias" {
  description = "AWS account alias (for example, amazon, self) or the AWS account ID of the AMI owner."
  value       = aws_ami.example.image_owner_alias
}
output "image_type" {
  description = "Type of image."
  value       = aws_ami.example.image_type
}
output "hypervisor" {
  description = "Hypervisor type of the image."
  value       = aws_ami.example.hypervisor
}

output "platform" {
  description = "This value is set to windows for Windows AMIs; otherwise, it is blank."
  value       = aws_ami.example.platform
}
output "public" {
  description = "Whether the image has public launch permissions."
  value       = aws_ami.example.public
}
output "tags_all" {
  description = " Map of tags assigned to the resource, including those inherited from the provider"
  value       = aws_ami.example.tags_all
}




