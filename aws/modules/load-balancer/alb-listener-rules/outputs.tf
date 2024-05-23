
output "alb_listener_rules_arn" {
  description = "The ARN of the rule"
  value       = aws_lb_listener_rule.alb_listnr_rule.*.arn

}
