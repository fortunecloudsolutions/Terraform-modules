
output "id" {
  #{"type":"string","default":"ecstest"}
  description = "The ID of the created ECS ecs_account_setting_default."
  value       = module.aws_ecs_cluster_capacity_providers.id
}
