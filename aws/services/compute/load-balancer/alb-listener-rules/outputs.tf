
output "alb_listener_rules_arn" {
  #{"type":"list","default":["dummy"]}
  description = "The ARN of the ALB listener rule"
  value       = module.alb_listnr_rule.alb_listener_rules_arn

}
