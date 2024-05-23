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



module "aws_iam_role_policy" {
  source     = "../../../modules/iam/iam-role-policy"
  
  iam_role       = var.iam_role
  role   = var.role
  iam_policy = var.iam_policy


}