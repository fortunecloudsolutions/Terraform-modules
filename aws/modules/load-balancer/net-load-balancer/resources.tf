
locals {
  tag_pairs = var.tags
}

resource "aws_lb" "nlb" {

  name                       = var.nlb_name
  internal                   = var.nlb_internal
  load_balancer_type         = "network"
  enable_deletion_protection = var.enable_nlb_delete_via_awsapi
  ip_address_type            = var.ip_address_type
  tags                       = local.tag_pairs

  dynamic "access_logs" {

    for_each = [for value in list(var.enable_access_logs) : lower(value) if value == true]
    content {
      bucket  = var.access_log_bucket_name
      enabled = var.enable_access_logs
    }
  }

  dynamic "subnet_mapping" {

    for_each = var.attach_nlb_subnet_ids
    content {
      subnet_id            = subnet_mapping.value
      allocation_id        = var.eip_alloc_ids[subnet_mapping.key]
      private_ipv4_address = var.private_ip4_for_internal_nlb[subnet_mapping.key]
    }
  }

}
