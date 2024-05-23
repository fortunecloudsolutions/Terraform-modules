resource "vault_aws_secret_backend" "aws" {
  access_key                = var.access_key
  secret_key                = var.secret_key
  region                    = var.region
  path                      = var.path
  default_lease_ttl_seconds = var.default_lease_seconds
  max_lease_ttl_seconds     = var.max_lease_seconds
}


