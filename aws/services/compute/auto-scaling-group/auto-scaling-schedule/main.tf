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

module "asg_schedule" {
  source                 = "../../../../modules/auto-scaling-group/auto-scaling-schedule"
  autoscaling_group_name = var.autoscaling_group_name
  scheduled_action_name  = var.scheduled_action_name
  start_time             = var.start_time
  end_time               = var.end_time
  recurrence             = var.recurrence
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
}
  