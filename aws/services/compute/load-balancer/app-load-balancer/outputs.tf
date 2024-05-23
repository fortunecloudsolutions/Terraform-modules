
output "alb_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the ALB load balancer"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  #{"type":"string","default":"dummy"}
  description = "The DNS name of the Application load balancer"
  value       = module.alb.alb_dns_name
}