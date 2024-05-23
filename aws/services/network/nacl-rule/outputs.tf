output "nacl_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the network ACL Rule"
  value       = module.nacl_rule.nacl_id
}

