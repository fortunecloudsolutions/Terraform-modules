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

module "replication_task" {
  source                    = "../../../../modules/migration/dms/replication-task/"
  cdc_start_time            = var.cdc_start_time
  migration_type            = var.migration_type
  replication_instance_arn  = var.replication_instance_arn
  replication_task_id       = var.replication_task_id
  replication_task_settings = var.replication_task_settings
  srce_endpoint_arn         = var.source_endpoint_arn
  table_mappings            = var.table_mappings
  tags                      = var.tags
  target_endpoint_arn       = var.target_endpoint_arn

}

resource "null_resource" "start_replicating" {
  triggers = {
    dms_task_arn = module.replication_task.replication_task_arn
  }
  provisioner "local-exec" {
    when    = create
    command = "sleep 120;AWS_ACCESS_KEY_ID=$ACCESS_KEY AWS_SECRET_ACCESS_KEY=$SECRET_KEY aws dms start-replication-task --start-replication-task-type start-replication --replication-task-arn ${self.triggers["dms_task_arn"]} --region=$REGION"
    environment = {
      ACCESS_KEY = data.vault_aws_access_credentials.creds.access_key
      SECRET_KEY = data.vault_aws_access_credentials.creds.secret_key
      REGION = var.region
    }
  }

}