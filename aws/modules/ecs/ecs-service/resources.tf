resource "aws_ecs_service" "service" {
  name                 = var.name   
  dynamic "capacity_provider_strategy" {
  for_each = var.capacity_provider_strategy != null ? [var.capacity_provider_strategy] : []    
  content {        
    base               = lookup(capacity_provider_strategy.value, "base")
    capacity_provider  = lookup(capacity_provider_strategy.value, "capacity_provider")
    weight             = lookup(capacity_provider_strategy.value, "weight")
  }
  }  
  cluster              = var.cluster
  dynamic "deployment_circuit_breaker" {
  for_each = var.deployment_circuit_breaker != null ? [var.deployment_circuit_breaker] : []    
  content {        
    enable    = lookup(deployment_circuit_breaker.value, "enable")
    rollback  = lookup(deployment_circuit_breaker.value, "rollback")
  }
  }     
  dynamic "deployment_controller" {
  for_each = var.deployment_controller != null ? [var.deployment_controller] : []    
  content {        
    type    = lookup(deployment_controller.value, "type")
  }
  }        
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  desired_count                      = var.desired_count
  enable_ecs_managed_tags            = var.enable_ecs_managed_tags
  enable_execute_command             = var.enable_execute_command
  force_new_deployment               = var.force_new_deployment
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  iam_role                           = var.iam_role
  launch_type                        = var.launch_type
  dynamic "load_balancer" {
  for_each = var.load_balancer != null ? [var.load_balancer] : []    
    content {
    elb_name            = lookup(load_balancer.value, "elb_name")
    target_group_arn    = lookup(load_balancer.value, "target_group_arn")
    container_name      = lookup(load_balancer.value, "container_name")
    container_port      = lookup(load_balancer.value, "container_port")
    }
  }
  
  dynamic "network_configuration" {
  for_each = var.network_configuration != null ? [var.network_configuration] : []    
    content {
    subnets            = lookup(network_configuration.value, "subnets")
    security_groups    = lookup(network_configuration.value, "security_groups")
    assign_public_ip   = lookup(network_configuration.value, "assign_public_ip")
    }
  }
  dynamic "ordered_placement_strategy" {
  for_each = var.ordered_placement_strategy != null ? [var.ordered_placement_strategy] : []    
    content {
    type          = lookup(ordered_placement_strategy.value, "type")
    field         = lookup(ordered_placement_strategy.value, "field")
    }
  }  
  
  dynamic "placement_constraints" {
  for_each = var.placement_constraints != null ? [var.placement_constraints] : []    
    content {
    type          = lookup(placement_constraints.value, "type")
    expression    = lookup(placement_constraints.value, "expression")
    }
  }   
  platform_version        = var.platform_version
  propagate_tags          = var.propagate_tags
  scheduling_strategy     = var.scheduling_strategy
  
  dynamic "service_registries" {
  for_each = var.service_registries != null ? [var.service_registries] : []    
    content {
    registry_arn      = lookup(service_registries.value, "registry_arn")
    port              = lookup(service_registries.value, "port")
    container_port    = lookup(service_registries.value, "container_port")
    container_name    = lookup(service_registries.value, "container_name")    
    }
  }  
  task_definition         = var.task_definition
  wait_for_steady_state   = var.wait_for_steady_state

}
