output "eip_assocation_id" {
  description = "Contains the EIP association ID"
  value       = aws_eip_association.eip_assoc.id
}
