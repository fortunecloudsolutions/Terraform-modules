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

module "asg" {
  source                    = "../../../../modules/auto-scaling-group/auto-scaling-group"
  asg_name                  = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  default_cooldown          = var.default_cooldown
  launch_configuration      = var.launch_configuration
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  # Load Balancers are only valid for Classic ELB, for ALB or NLB input target_group_arns
  elb_load_balancers        = var.elb_load_balancers
  subnet_ids                = var.subnet_ids
  target_group_arns         = var.target_group_arns
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  placement_group           = var.placement_group
  metrics_granularity       = var.metrics_granularity
  enabled_metrics           = var.enabled_metrics
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  max_instance_lifetime     = var.max_instance_lifetime
  initial_lifecycle_hook    = var.initial_lifecycle_hook
  launch_template           = var.launch_template
  mixed_instances_policy    = var.mixed_instances_policy
  tags                      = var.tags

}