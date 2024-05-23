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


module "cluster_instance" {
  source                       = "../../../../modules/database/neptune/neptune-cluster-instance"
  cluster_identifier           = var.cluster_identifier
  engine                       = var.engine
  instance_class               = var.instance_class
  apply_immediately            = var.apply_immediately
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  availability_zone            = var.availability_zone
  engine_version               = var.engine_version
  identifier                   = var.identifier
  identifier_prefix            = var.identifier_prefix
  neptune_subnet_group_name    = var.neptune_subnet_group_name
  neptune_parameter_group_name = var.neptune_parameter_group_name
  port                         = var.port
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  promotion_tier               = var.promotion_tier
  publicly_accessible          = var.publicly_accessible
  tags                         = var.tags
  timeouts                     = var.timeouts

}