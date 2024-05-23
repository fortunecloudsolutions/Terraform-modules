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


module "job_queue" {
  source               = "../../../../modules/compute/batch/batch-job-queue"
  name                 = var.name
  state                = var.state
  priority             = var.priority
  compute_environments = var.compute_environments
  tags                 = var.tags
}