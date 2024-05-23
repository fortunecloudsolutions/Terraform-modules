resource "aws_ami" "example" {
  name                = var.name
  virtualization_type = var.virtualization_type
  root_device_name    = var.root_device_name
  imds_support        = var.imds_support


  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device != null ? [var.ebs_block_device] : []
    content {
      device_name = lookup(ebs_block_device.value, "device_name")
      snapshot_id = lookup(ebs_block_device.value, "snapshot_id")
      volume_size = lookup(ebs_block_device.value, "volume_size")
    }

  }

}
