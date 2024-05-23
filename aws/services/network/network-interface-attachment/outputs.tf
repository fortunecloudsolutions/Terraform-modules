

output "instance_id" {
  #{"type":"string","default":"dummy"}
  description = "Instance ID."
  value       = module.aws_network_interface_attachment.instance_id
}


output "network_interface_id" {
  #{"type":"string","default":"dummy"}
  description = "Network interface ID."
  value       = module.aws_network_interface_attachment.network_interface_id
}

output "attachment_id" {
  #{"type":"string","default":"dummy"}
  description = "The ENI Attachment ID."
  value       = module.aws_network_interface_attachment.attachment_id
}

output "status" {
  #{"type":"string","default":"dummy"}
  description = "TThe status of the Network Interface Attachment."
  value       = module.aws_network_interface_attachment.status
}







