
output "alb_listener_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the ALB listener"
  value       = module.alb_listnr.alb_listener_arn
}
