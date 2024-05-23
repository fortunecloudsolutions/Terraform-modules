output "eip_id" {
  description = "Contains the EIP allocation ID"
  value       = aws_eip.standaloneeip.id
}

output "elastic_public_ip" {
  description = "Contains the public IP address."
  value       = aws_eip.standaloneeip.public_ip
}

