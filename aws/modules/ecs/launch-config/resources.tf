

resource "aws_launch_configuration" "cluster" {
  name          = var.name
  image_id      = var.image_id
  instance_type = var.cluster_instance_type
  key_name      = var.key_name

  iam_instance_profile = var.instance_profile

  user_data = var.user_data

  security_groups = var.security_group

  associate_public_ip_address      = var.associate_public_ip_address
  vpc_classic_link_id              = var.vpc_classic_link_id
  vpc_classic_link_security_groups = var.vpc_classic_link_security_groups
  #user_data_base64 = var.user_data_base64
  enable_monitoring = var.enable_monitoring
  ebs_optimized     = var.ebs_optimized

  spot_price        = var.spot_price
  placement_tenancy = var.placement_tenancy
  #tags                   = var.tags

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    iops                  = var.iops
    delete_on_termination = var.delete_on_termination
    encrypted             = var.encrypted
  }

  lifecycle {
    create_before_destroy = true
  }
}
