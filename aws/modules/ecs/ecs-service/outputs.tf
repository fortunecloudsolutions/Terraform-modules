output "cluster" {
  description = "Amazon Resource Name (ARN) of cluster which the service runs on."
  value       = aws_ecs_service.service.cluster
}
output "desired_count" {
  description = "Number of instances of the task definition."
  value       = aws_ecs_service.service.desired_count
}
output "iam_role" {
  description = "ARN of IAM role used for ELB."
  value       = aws_ecs_service.service.iam_role
}
output "id" {
  description = "ARN that identifies the service."
  value       = aws_ecs_service.service.id
}
output "name" {
  description = "The name of the service."
  value       = aws_ecs_service.service.name
}
output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_ecs_service.service.tags_all
}