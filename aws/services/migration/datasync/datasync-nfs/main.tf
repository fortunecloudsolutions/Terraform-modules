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

module "datasync_nfs" {
  source          = "../../../../modules/migration/datasync/datasync-nfs/"
  mount_options   = var.mount_options
  on_prem_config  = var.on_prem_config
  server_hostname = var.server_hostname
  subdirectory    = var.subdirectory
  tags            = var.tags
}