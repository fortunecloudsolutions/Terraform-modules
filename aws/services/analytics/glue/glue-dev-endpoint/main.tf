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


module "dev_endpoint" {
  source                    = "../../../../modules/analytics/glue/glue-dev-endpoint"
  name                      = var.name
  role_arn                  = var.role_arn
  arguments                 = var.arguments
  extra_jars_s3_path        = var.extra_jars_s3_path
  extra_python_libs_s3_path = var.extra_python_libs_s3_path
  glue_version              = var.glue_version
  number_of_nodes           = var.number_of_nodes
  number_of_workers         = var.number_of_workers
  public_key                = var.public_key
  public_keys               = var.public_keys
  security_configuration    = var.security_configuration
  security_group_ids        = var.security_group_ids
  subnet_id                 = var.subnet_id
  tags                      = var.tags
  worker_type               = var.worker_type

}