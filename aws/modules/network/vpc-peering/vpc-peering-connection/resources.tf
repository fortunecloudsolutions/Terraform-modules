resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.vpc_id
  auto_accept   = var.auto_accept
  peer_region   = var.peer_region

  dynamic "accepter" {
    for_each = var.accepter != null ? [var.accepter] : []
    content {
      allow_remote_vpc_dns_resolution  = lookup(accepter.value, "allow_remote_vpc_dns_resolution", null)
      allow_classic_link_to_remote_vpc = lookup(accepter.value, "allow_classic_link_to_remote_vpc", null)
      allow_vpc_to_remote_classic_link = lookup(accepter.value, "allow_vpc_to_remote_classic_link", null)
    }
  }

  dynamic "requester" {
    for_each = var.requester != null ? [var.requester] : []
    content {
      allow_remote_vpc_dns_resolution  = lookup(requester.value, "allow_remote_vpc_dns_resolution", null)
      allow_classic_link_to_remote_vpc = lookup(requester.value, "allow_classic_link_to_remote_vpc", null)
      allow_vpc_to_remote_classic_link = lookup(requester.value, "allow_vpc_to_remote_classic_link", null)
    }
  }

  tags = var.tags

  timeouts {
    create = lookup(var.timeouts, "create", "15m")
    update = lookup(var.timeouts, "update", "15m")
    delete = lookup(var.timeouts, "delete", "15m")
  }

}

