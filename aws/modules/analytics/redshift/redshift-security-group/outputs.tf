output "id" {
  description = "The Redshift security group ID."
  value       = aws_redshift_security_group.security_group.id
}