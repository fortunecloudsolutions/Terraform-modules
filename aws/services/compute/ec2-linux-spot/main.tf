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

module "ec2" {
  source                          = "../../../modules/ec2/ec2-instance-spot"
  ami                             = var.ami
  instance_type                   = var.instance_type
  subnet_id                       = var.subnet_id
  vpc_security_group_ids          = var.vpc_security_group_ids
  key_name                        = var.key_name
  availability_zone               = var.availability_zone
  user_data1                      = var.user_data
  associate_public_ip_address     = var.associate_public_ip_address
  get_password_data               = null
  tags                            = var.tags
  ebs_optimized                   = var.ebs_optimized
  monitoring                      = var.monitoring
  root_block_device               = var.root_block_device
  ebs_block_device                = var.ebs_block_device
  ephemeral_block_device          = var.ephemeral_block_device
  spot_price                      = var.spot_price
  wait_for_fulfillment            = var.wait_for_fulfillment
  spot_type                       = var.spot_type
  launch_group                    = var.launch_group
  block_duration_minutes          = var.block_duration_minutes
  instance_interruption_behaviour = var.instance_interruption_behaviour
  valid_until                     = var.valid_until
  valid_from                      = var.valid_from
  timeouts                        = var.timeouts


}
