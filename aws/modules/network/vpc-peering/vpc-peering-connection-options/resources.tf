resource "aws_vpc_peering_connection_options" "vpc_peering_options" {
  vpc_peering_connection_id = var.vpc_peering_connection_id

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

}