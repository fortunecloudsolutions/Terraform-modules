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


module "aws_lambda_function_url" {
  source             = "../../../../modules/compute/lambda/aws-lambda-function-url"
  function_name      = var.function_name
  authorization_type = var.authorization_type
  cors               = var.cors

}
