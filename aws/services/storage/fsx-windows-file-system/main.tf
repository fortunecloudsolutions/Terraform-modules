provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.max_lease_seconds
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

module "fsx_windows" {
  source                            = "../../../modules/volumes/fsx-windows-file-system"
  storage_capacity                  = var.storage_capacity
  subnet_ids                        = var.subnet_ids
  throughput_capacity               = var.throughput_capacity
  active_directory_id               = var.active_directory_id
  automatic_backup_retention_days   = var.automatic_backup_retention_days
  copy_tags_to_backups              = var.copy_tags_to_backups
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  kms_key_arn                       = var.kms_key_arn
  security_group_ids                = var.security_group_ids
  self_managed_active_directory     = var.self_managed_active_directory
  skip_final_backup                 = var.skip_final_backup
  tags                              = var.tags
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time
  deployment_type                   = var.deployment_type
  preferred_subnet_id               = var.preferred_subnet_id
  storage_type                      = var.storage_type
  timeouts                          = var.timeouts

}