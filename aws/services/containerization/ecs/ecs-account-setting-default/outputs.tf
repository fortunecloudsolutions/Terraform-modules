output "id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the created ECS ecs_account_setting_default."
  value       = module.aws_ecs_account_setting_default.id
}

