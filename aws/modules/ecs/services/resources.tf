
locals {
  environment     = var.environment
  protocol        = var.protocol
  container_ports = var.container_port
}


locals {
  lb_target_groups = [
    {
      lb_target_group_arn         = var.target_arn
      container_port              = element(local.container_ports, 0)
      container_health_check_port = element(local.container_ports, 0)
    }
  ]
}
resource "aws_ecs_service" "service" {
  name            = var.name
  cluster         = var.cluster
  task_definition = var.task_definition
  #iam_role = var.role_arn
  desired_count                      = var.desired_count
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  force_new_deployment               = var.force_new_deployment
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  launch_type                        = var.launch_type
  platform_version                   = var.platform_version
  scheduling_strategy                = var.scheduling_strategy
  dynamic "load_balancer" {
    for_each = local.lb_target_groups
    content {
      container_name   = var.container_name
      target_group_arn = load_balancer.value.lb_target_group_arn
      container_port   = load_balancer.value.container_port
    }
  }


}
