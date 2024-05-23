resource "aws_ami_from_instance" "ami" {
  name                    = var.name
  source_instance_id      = var.source_instance_id
  snapshot_without_reboot = var.snapshot_without_reboot
  tags                    = var.tags

  timeouts {
    create = lookup(var.timeouts, "create", "60m")
    update = lookup(var.timeouts, "update", "60m")
    delete = lookup(var.timeouts, "delete", "60m")
  }

}
