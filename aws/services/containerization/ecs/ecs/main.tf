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

module "cluster_instance_role" {
  source = "../../../../modules/iam/iam-role"
  #name = "cluster-instance-role-${var.component}-${var.deployment_identifier}-${var.cluster_name}"

  role_policy = file("${path.module}/policies/cluster-instance-role.json")

  tags = { "Name" : "cluster-instance-role-${var.component}-${var.deployment_identifier}-${var.cluster_name}" }
}
module "cluster_instance_policy" {
  source = "../../../../modules/iam/iam-policy"
  #name        = "cluster-instance-policy-${var.component}-${var.deployment_identifier}-${var.cluster_name}"
  path = "/"
  #description = "cluster-instance-policy-${var.component}-${var.deployment_identifier}-${var.cluster_name}"

  iam_policy = file("${path.module}/policies/cluster-instance-policy.json")
}
module "cluster_instance_policy_attachment" {
  source     = "../../../../modules/iam/role-policy-attach"
  role       = module.cluster_instance_role.role_name
  policy_arn = module.cluster_instance_policy.policy_arn
}
module "iam_cluster" {
  source = "../../../../modules/iam/iam-profile"
  #name= "cluster-policy-${var.component}-${var.deployment_identifier}-${var.cluster_name}"
  path = "/"
  role = module.cluster_instance_role.role_name
}
#*******************************************************#
#      Create Cluster
#********************************************************
module "cluster" {
  source = "../../../../modules/ecs/cluster"
  name   = var.cluster_name
  tags   = var.cluster_custom_tags
}
#*******************************************************#
#         User data for Linux ECS
#********************************************************
data "template_file" "cluster_user_data" {
  template = file("${path.module}/user-data/cluster.tpl")

  vars = {
    cluster_name = module.cluster.cluster_name
  }
}
#*******************************************************#
#      Load AMI's for ECS
#********************************************************
data "aws_ami" "this" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }
}
/*data "template_file" "ami_id" {
  template = coalesce( data.aws_ami.this.image_id, lookup(var.cluster_instance_amis, var.region))
}*/
#*******************************************************#
#      User data for Windows ECS
#********************************************************
locals {
  userdata = <<EOF
<powershell>
Import-Module ECSTools
Initialize-ECSAgent -Cluster ${var.cluster_name} -EnableTaskIAMRole -LoggingDrivers '["json-file","awslogs"]'
</powershell>
<persist>true</persist>
EOF
}
#*******************************************************#
#      Data source to Load AMI's for ECS
#********************************************************
data "template_file" "ami_id" {
  template = data.aws_ami.this.image_id
}
/*data "template_file" "ami_id" {
  template = coalesce(data.aws_ami.amazon_linux_2.image_id, lookup(var.cluster_instance_amis, var.region))
}*/
/*data "template_file" "ami_id" {
  template = coalesce(data.aws_ami.this.image_id, lookup(var.cluster_instance_amis, var.region))
}*/
#*******************************************************#
#          Cluster Launch Config
#********************************************************
module "cluster_launch_config" {
  source = "../../../../modules/ecs/launch-config"
  #name_prefix = "${var.component}-${var.deployment_identifier}-${var.cluster_name}"
  image_id              = data.template_file.ami_id.rendered #var.os_map["${var.os_desc}"]
  cluster_instance_type = var.cluster_instance_type
  key_name              = var.key_name

  instance_profile = module.iam_cluster.profile_name

  user_data = data.template_file.cluster_user_data.rendered
  #user_data = base64encode(local.userdata)

  security_group = var.security_group

  associate_public_ip_address = var.public_ip
  volume_size                 = var.block_device_size
  volume_type                 = var.block_device_type
}
#*******************************************************#
#          Auto Scaling group for ECS
#********************************************************
module "auto_scaling_group" {
  source       = "../../../../modules/ecs/autoscaling"
  cluster_name = module.cluster_launch_config.launch_configuration_name

  subnet_ids = var.subnet_ids

  cluster_minimum_size     = var.min_size
  cluster_maximum_size     = var.max_size
  cluster_desired_capacity = var.capacity
  custom_tags              = var.scaling_custom_tags
}

