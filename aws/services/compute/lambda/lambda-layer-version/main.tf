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


module "lambda_layer" {
  source              = "../../../../modules/compute/lambda/lambda-layer-version"
  filename            = var.filename
  layer_name          = var.layer_name
  compatible_runtimes = var.compatible_runtimes
  s3_bucket           = var.s3_bucket
  s3_key              = var.s3_key
  s3_object_version   = var.s3_object_version
  description         = var.description
  license_info        = var.license_info
  source_code_hash    = var.source_code_hash
}