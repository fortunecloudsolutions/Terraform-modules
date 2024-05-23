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
/*module "cluster_service_role" {
  source = "../../../modules/iam/iam-role"
  #name = "cluster-service-role-${var.component}-${var.deployment_identifier}-${var.cluster_name}"

  role_policy = file("${path.module}/policies/cluster-service-role.json")

  tags = {"Name":"cluster-instance-role-${var.component}-${var.deployment_identifier}-${var.cluster_name}"}
}
module "cluster_service_policy" {
  source = "../../../modules/iam/iam-policy"
  #name        = "cluster-service-policy-${var.component}-${var.deployment_identifier}-${var.cluster_name}"
  path        = "/"
  #description = "cluster-instance-policy-${var.component}-${var.deployment_identifier}-${var.cluster_name}"

  iam_policy = file("${path.module}/policies/cluster-service-policy.json")
}
module "cluster_service_policy_attachment" {
  source = "../../../modules/iam/role-policy-attach"
  role = module.cluster_service_role.role_name
  policy_arn = module.cluster_service_policy.policy_arn
}/
/*locals {
  environment                 = "test"
  protocol                    = "HTTP"
  hello_world_container_ports = [80]
}*/
module "task_definition" {
  source                = "../../../../modules/ecs/task-definition"
  family                = var.family
  container_definitions = file("${path.module}/task-definitions/${var.file_name}")
}
module "services" {
  source           = "../../../../modules/ecs/services"
  task_definition  = module.task_definition.task_arn
  target_arn       = var.target_arn
  environment      = var.environment
  protocol         = var.protocol
  platform_version = var.platform_version

  name          = var.service_name
  cluster       = var.cluster_id
  desired_count = var.number_count


  container_name = var.container_name
  container_port = var.container_port
  #depends_on = [module.target_group,module.alb,module.alb_listener]
}
