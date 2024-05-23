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

module "task_set" {
  source                      = "../../../../modules/ecs/ecs-task-set"
  service                     = var.service
  cluster                     = var.cluster
  task_definition             = var.task_definition
  capacity_provider_strategy  = var.capacity_provider_strategy
  external_id                 = var.external_id
  force_delete                = var.force_delete
  launch_type                 = var.launch_type
  load_balancer               = var.load_balancer
  platform_version            = var.platform_version
  network_configuration       = var.network_configuration
  scale                       = var.scale
  service_registries          = var.service_registries
  tags                        = var.tags
  wait_until_stable           = var.wait_until_stable
  wait_until_stable_timeout   = var.wait_until_stable_timeout 
}