resource "aws_ecs_task_set" "task_set" {
  service             = var.service
  cluster             = var.cluster
  task_definition     = var.task_definition 
  dynamic "capacity_provider_strategy" {
  for_each = var.capacity_provider_strategy != null ? [var.capacity_provider_strategy] : []    
  content {        
    capacity_provider  = lookup(capacity_provider_strategy.value, "capacity_provider")
    weight             = lookup(capacity_provider_strategy.value, "weight")
    base               = lookup(capacity_provider_strategy.value, "base")
  }
  }
  external_id     = var.external_id
  force_delete    = var.force_delete
  launch_type     = var.launch_type
  dynamic "load_balancer" {
  for_each = var.load_balancer != null ? [var.load_balancer] : []    
    content {
    load_balancer_name  = lookup(deployment_controller.value, "load_balancer_name")
    target_group_arn    = lookup(deployment_controller.value, "target_group_arn")
    container_name      = lookup(deployment_controller.value, "container_name")
    container_port      = lookup(deployment_controller.value, "container_port")
    }
  }  
  platform_version    = var.platform_version
  dynamic "network_configuration" {
  for_each = var.network_configuration != null ? [var.network_configuration] : []    
    content {
    subnets            = lookup(network_configuration.value, "subnets")
    security_groups    = lookup(network_configuration.value, "security_groups")
    assign_public_ip   = lookup(network_configuration.value, "assign_public_ip")
    }
  }  
  dynamic "scale" {
  for_each = var.scale != null ? [var.scale] : []    
  content {        
    unit  = lookup(setting.value, "unit")
    value = lookup(setting.value, "value")
  }
  }  
  dynamic "service_registries" {
  for_each = var.service_registries != null ? [var.service_registries] : []    
    content {
    registry_arn      = lookup(service_registries.value, "registry_arn")
    port              = lookup(service_registries.value, "port")
    container_port    = lookup(service_registries.value, "container_port")
    container_name    = lookup(service_registries.value, "container_name")    
    }
  }  
  tags                      = var.tags
  wait_until_stable         = var.wait_until_stable
  wait_until_stable_timeout = var.wait_until_stable_timeout
}