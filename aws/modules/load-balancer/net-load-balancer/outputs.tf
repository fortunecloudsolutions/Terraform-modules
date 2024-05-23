
output "nlb_arn" {
  description = "The ARN of the Application load balancer"
  value       = aws_lb.nlb.arn
}

output "nlb_dns_name" {
  description = "The DNS name of the Network load balancer"
  value       = aws_lb.nlb.dns_name
}
