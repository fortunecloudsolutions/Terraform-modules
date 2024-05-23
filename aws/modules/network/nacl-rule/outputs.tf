output "nacl_id" {
  description = "The ID of the network ACL Rule"
  value       = aws_network_acl_rule.nacl_rule.id
}
