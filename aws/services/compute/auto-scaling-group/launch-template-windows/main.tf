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


data "template_file" "init" {
  template = file("${path.module}/../../templates/${var.user_data_filename}")

}

module "launch_template" {
  source                               = "../../../../modules/auto-scaling-group/launch-template-windows"
  tags                                 = var.tags
  template_name                        = var.template_name
  template_description                 = var.template_description
  block_device_mappings                = var.block_device_mappings
  credit_specification                 = var.credit_specification
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized
  elastic_gpu_specifications           = var.elastic_gpu_specifications
  elastic_inference_accelerator        = var.elastic_inference_accelerator
  iam_instance_profile_arn             = var.iam_instance_profile_arn
  iam_instance_profile_name            = var.iam_instance_profile_name
  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_market_options              = var.instance_market_options
  instance_type                        = var.instance_type
  kernel_id                            = var.kernel_id
  key_name                             = var.key_name
  license_specification                = var.license_specification
  metadata_options                     = var.metadata_options
  enable_monitoring                    = var.enable_monitoring
  network_interfaces                   = var.network_interfaces
  placement                            = var.placement
  ram_disk_id                          = var.ram_disk_id
  vpc_security_group_ids               = var.vpc_security_group_ids
  tag_specifications                   = var.tag_specifications
  user_data                            = var.user_data_filename != null ? data.template_file.init.rendered : null
  hibernation_options                  = var.hibernation_options
}