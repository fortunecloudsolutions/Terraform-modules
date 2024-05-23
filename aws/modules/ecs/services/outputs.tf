output "service_arn" {
  description = "The service arn"
  value       = aws_ecs_service.service.id
}

output "service_name" {
  description = "The name of the service."
  value       = aws_ecs_service.service.name
}

output "service_arn_name" {
  description = "The ARN name."
  value       = aws_ecs_service.service.cluster
}
output "service_iam_role" {
  description = "The service iam role."
  value       = aws_ecs_service.service.iam_role
}