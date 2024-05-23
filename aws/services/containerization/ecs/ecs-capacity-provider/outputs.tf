
output "id" {
  #{"type":"string","default":"arn:aws:ecs:us-east-2:046692759124:capacity-provider/test"}
  description = "The ID of the created ECS ecs_account_setting_default."
  value       = module.aws_ecs_capacity_provider.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:ecs:us-east-2:046692759124:capacity-provider/test"}
  description = "The ID of the created ECS ecs_account_setting_default."
  value       = module.aws_ecs_capacity_provider.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "The ID of the created ECS ecs_account_setting_default."
  value       = module.aws_ecs_capacity_provider.tags_all
}
