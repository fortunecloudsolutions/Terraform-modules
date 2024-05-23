resource "aws_datasync_agent" "agent" {
  name           = var.name
  activation_key = var.activation_key
  ip_address     = var.ip_address
  tags           = var.tags

  timeouts {
    create = lookup(var.timeouts, "create", "60m")
  }

}