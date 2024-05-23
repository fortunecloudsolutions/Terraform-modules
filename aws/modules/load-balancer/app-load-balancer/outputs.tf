
output "alb_arn" {
  description = "The ARN of the Application load balancer"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application load balancer"
  value       = aws_lb.alb.dns_name
}
