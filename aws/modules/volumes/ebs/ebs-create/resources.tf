resource "aws_ebs_volume" "ebs" {
  availability_zone    = var.availability_zone
  size                 = var.ebs_size
  encrypted            = var.encrypted
  iops                 = var.iops
  multi_attach_enabled = var.multi_attach_enabled
  snapshot_id          = var.snapshot_id
  type                 = var.type
  kms_key_id           = var.kms_key_id
  tags                 = var.tags

}
