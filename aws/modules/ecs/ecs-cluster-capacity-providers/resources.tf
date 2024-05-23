resource "aws_ecs_cluster_capacity_providers" "ClusterCP" {
  
  cluster_name        = var.cluster_name
  capacity_providers  = var.capacity_providers

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy != null ? [var.default_capacity_provider_strategy] : []
    content {
      weight            = lookup(default_capacity_provider_strategy.value, "weight")
      base              = lookup(default_capacity_provider_strategy.value, "base")
      capacity_provider = lookup(default_capacity_provider_strategy.value, "capacity_provider")
    }

  }
}