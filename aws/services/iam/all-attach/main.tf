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
module "all_attach" {
  source     = "../../../modules/iam/all-attach"
  name       = var.name
  user_list  = var.user_list
  roles_list = var.roles_list
  group_list = var.group_list
  policy_arn = var.policy_arn
}