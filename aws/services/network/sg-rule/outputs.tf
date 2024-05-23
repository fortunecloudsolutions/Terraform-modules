output "sg_rule_id" {
  #{"type":"list","default":["dummy"]}
  description = "The ID of the security group rule"
  value       = module.sg_rule.sg_rule_id
}
