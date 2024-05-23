
output "arn" {
  #{"type":"string","default":"dummy"}
  description = "ARN of the AMI."
  value       = module.aws_ami.arn
}

output "id" {
  #{"type":"string","default":"dummy"}
  description = "ID of the created AMI."
  value       = module.aws_ami.id
}

output "root_snapshot_id" {
  #{"type":"string","default":"dummy"}
  description = "Snapshot ID for the root volume (for EBS-backed AMIs)"
  value       = module.aws_ami.root_snapshot_id
}

output "owner_id" {
  #{"type":"string","default":"dummy"}
  description = "AWS account ID of the image owner."
  value       = module.aws_ami.owner_id
}

output "usage_operation" {
  #{"type":"string","default":"dummy"}
  description = "Operation of the Amazon EC2 instance and the billing code that is associated with the AMI."
  value       = module.aws_ami.usage_operation
}

output "platform_details" {
  #{"type":"string","default":"dummy"}
  description = "Platform details associated with the billing code of the AMI."
  value       = module.aws_ami.platform_details
}

output "image_owner_alias" {
  #{"type":"string","default":"dummy"}
  description = "AWS account alias (for example, amazon, self) or the AWS account ID of the AMI owner."
  value       = module.aws_ami.image_owner_alias
}
output "image_type" {
  #{"type":"string","default":"dummy"}
  description = "Type of image."
  value       = module.aws_ami.image_type
}
output "hypervisor" {
  #{"type":"string","default":"dummy"}
  description = "Hypervisor type of the image."
  value       = module.aws_ami.hypervisor
}

output "platform" {
  #{"type":"string","default":"dummy"}
  description = "This value is set to windows for Windows AMIs; otherwise, it is blank."
  value       = module.aws_ami.platform
}
output "public" {
  #{"type":"string","default":"dummy"}
  description = "Whether the image has public launch permissions."
  value       = module.aws_ami.public
}
output "tags_all" {
  #{"type":"string","default":"dummy"}
  description = " Map of tags assigned to the resource, including those inherited from the provider"
  value       = module.aws_ami.tags_all
}




