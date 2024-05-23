provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}
provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

module "service" {
  source                              = "../../../../modules/ecs/ecs-service"
  name                                = var.name
  capacity_provider_strategy          = var.capacity_provider_strategy
  cluster                             = var.cluster
  deployment_circuit_breaker          =  var.deployment_circuit_breaker
  deployment_controller               = var.deployment_controller
  deployment_maximum_percent          = var.deployment_maximum_percent
  deployment_minimum_healthy_percent  = var.deployment_minimum_healthy_percent
  desired_count                       = var.desired_count
  enable_ecs_managed_tags             = var.enable_ecs_managed_tags
  enable_execute_command              = var.enable_execute_command
  force_new_deployment                = var.force_new_deployment
  health_check_grace_period_seconds   = var.health_check_grace_period_seconds
  iam_role                            = var.iam_role
  launch_type                         = var.launch_type
  load_balancer                       = var.load_balancer
  network_configuration               = var.network_configuration
  ordered_placement_strategy          = var.ordered_placement_strategy
  placement_constraints               = var.placement_constraints
  platform_version                    = var.platform_version
  propagate_tags                      = var.propagate_tags
  scheduling_strategy                 = var.scheduling_strategy
  service_registries                  = var.service_registries
  task_definition                     = var.task_definition
  wait_for_steady_state               = var.wait_for_steady_state
}