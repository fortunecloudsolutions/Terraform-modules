resource "aws_ecs_capacity_provider" "test" {

  name = var.name

  dynamic "auto_scaling_group_provider" {
    for_each = var.auto_scaling_group_provider != null ? [var.auto_scaling_group_provider] : []
    content {
      auto_scaling_group_arn         = lookup(auto_scaling_group_provider.value, "auto_scaling_group_arn")
      managed_termination_protection = lookup(auto_scaling_group_provider.value, "managed_termination_protection")
      dynamic "managed_scaling" {
        for_each = lookup(auto_scaling_group_provider.value, "managed_scaling") != null ? [lookup(var.auto_scaling_group_provider, "managed_scaling")] : []
        content {
          maximum_scaling_step_size = lookup(managed_scaling.value, "maximum_scaling_step_size")
          minimum_scaling_step_size = lookup(managed_scaling.value, "minimum_scaling_step_size")
          status                    = lookup(managed_scaling.value, "status")
          target_capacity           = lookup(managed_scaling.value, "target_capacity")
          instance_warmup_period    = lookup(managed_scaling.value, "instance_warmup_period")
        }

      }
    }
  }
}