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

module "aws_ecs_task_definition" {
  source                   = "../../../../modules/ecs/ecs-task-definition"
  family                   = var.family
  container_definitions    = var.container_definitions
  cpu                      = var.cpu
  execution_role_arn       = var.execution_role_arn
  ipc_mode                 = var.ipc_mode
  memory                   = var.memory
  network_mode             = var.network_mode
  pid_mode                 = var.pid_mode
  requires_compatibilities = var.requires_compatibilities
  tags                     = var.tags
  task_role_arn            = var.task_role_arn
  inference_accelerator    = var.inference_accelerator
  runtime_platform         = var.runtime_platform
  placement_constraints    = var.placement_constraints
  proxy_configuration      = var.proxy_configuration
  ephemeral_storage        = var.ephemeral_storage
  volume                   = var.volume

}

