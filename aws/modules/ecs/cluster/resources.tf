resource "aws_ecs_cluster" "cluster" {
  name               = var.name
  capacity_providers = var.capacity_providers
  #default_capacity_provider_strategy = var.default_capacity_provider_strategy
  #setting = var.setting
  tags = var.tags

}