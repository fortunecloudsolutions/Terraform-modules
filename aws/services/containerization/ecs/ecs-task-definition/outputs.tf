output "task_definition_arn" {
  #{"type":"string","default":"arn:aws:ecs:us-west-2:123456789012:task-definition/hello_world:8"}
  description = " Full ARN of the Task Definition (including both family and revision)."
  value       = module.aws_ecs_task_definition.task_definition_arn

}
