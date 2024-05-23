resource "aws_network_interface" "example" {
    subnet_id       = var.subnet_id
  security_groups = var.security_groups
  private_ip_list  = var.private_ip_list


  dynamic "attachment" {
    for_each = var.attachment != null ? [var.attachment] : []
    content {
      instance     = lookup(attachment.value, "instance")
      device_index = lookup(attachment.value, "device_index")
    }

  }

}
