resource "aws_network_interface" "multi-ip" {
  subnet_id         = var.subnet_id
  description       = var.description
  private_ips       = var.private_ips
  private_ips_count = var.private_ips_count
  source_dest_check = var.source_dest_check

}