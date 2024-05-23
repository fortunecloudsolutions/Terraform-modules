output "instance_id" {
  description = "Instance ID."
  value       = aws_network_interface_attachment.example.instance_id
}


output "network_interface_id" {
  description = "Network interface ID."
  value       = aws_network_interface_attachment.example.network_interface_id
}

output "attachment_id" {
  description = "The ENI Attachment ID."
  value       = aws_network_interface_attachment.example.attachment_id
}

output "status" {
  description = "TThe status of the Network Interface Attachment."
  value       = aws_network_interface_attachment.example.status
}







