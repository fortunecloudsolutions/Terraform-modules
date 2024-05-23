output "nacl_id" {
  description = "The ID of the network ACL"
  value       = aws_network_acl.main_nacl.id
}
