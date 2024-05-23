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

module "alb" {
  source                         = "../../../../modules/load-balancer/target-group-alb"
  target_group_name              = var.target_group_name
  target_port                    = var.target_port
  target_protocol                = var.target_protocol
  target_vpc_id                  = var.target_vpc_id
  deregistration_delay           = var.deregistration_delay
  slow_start                     = var.slow_start
  load_balancing_algorithm_type  = var.load_balancing_algorithm_type
  target_type                    = var.target_type
  tags                           = var.tags
  sticky_type                    = var.sticky_type
  sticky_cookie_duration         = var.sticky_cookie_duration
  sticky_enabled                 = var.sticky_enabled
  health_check_enabled           = var.health_check_enabled
  health_check_interval          = var.health_check_interval
  health_check_path              = var.health_check_path
  health_check_port              = var.health_check_port
  health_check_protocol          = var.health_check_protocol
  health_check_timeout           = var.health_check_timeout
  healthy_threshold              = var.healthy_threshold
  unhealthy_threshold            = var.unhealthy_threshold
  health_check_success_resp_code = var.health_check_success_resp_code
}