
locals {
  tag_pairs = var.tags
}

resource "aws_lb" "alb" {

  name                       = var.alb_name
  internal                   = var.alb_internal
  load_balancer_type         = "application"
  security_groups            = var.security_group_ids
  idle_timeout               = var.idle_timeout
  enable_deletion_protection = var.enable_alb_delete_via_awsapi
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

    for_each = var.attach_alb_subnet_ids
    content {
      subnet_id            = subnet_mapping.value
      allocation_id        = var.eip_alloc_ids[subnet_mapping.key]
      private_ipv4_address = var.private_ip4_for_internal_alb[subnet_mapping.key]
    }
  }

}
