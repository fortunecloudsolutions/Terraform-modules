output "health_check_id" {
  description = "The id of the health check."
  value       = aws_route53_health_check.health_check.id
}

