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

module "asg_attachment" {
  source           = "../../../../modules/auto-scaling-group/auto-scaling-group-attachment"
  asg_name         = var.asg_name
  target_group_arn = var.target_group_arn
  elb_name         = var.elb_name
}