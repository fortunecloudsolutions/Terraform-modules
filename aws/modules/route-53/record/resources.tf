resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.alias == null ? var.ttl : null
  records = var.alias == null ? var.records : null
  set_identifier = ((var.policy_type == "failover" || var.policy_type == "geolocation"
  || var.policy_type == "latency" || var.policy_type == "weighted") ? var.set_identifier : null)

  health_check_id = var.health_check_id != null ? var.health_check_id : null

  dynamic "alias" {
    for_each = var.alias != null ? [var.alias] : []
    content {
      name                   = lookup(alias.value, "name")
      zone_id                = lookup(alias.value, "zone_id", null)
      evaluate_target_health = lookup(alias.value, "evaluate_target_health")
    }
  }

  dynamic "failover_routing_policy" {
    for_each = var.failover_routing_policy != null && var.policy_type == "failover" ? [var.failover_routing_policy] : []
    content {
      type = lookup(failover_routing_policy.value, "typ")
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = var.geolocation_routing_policy != null && var.policy_type == "geolocation" ? [var.geolocation_routing_policy] : []
    content {
      continent   = lookup(geolocation_routing_policy.value, "continent")
      country     = lookup(geolocation_routing_policy.value, "country")
      subdivision = lookup(geolocation_routing_policy.value, "subdivision")
    }
  }

  dynamic "latency_routing_policy" {
    for_each = var.latency_routing_policy != null && var.policy_type == "geolocation" ? [var.latency_routing_policy] : []
    content {
      region = lookup(latency_routing_policy.value, "region")
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = var.weighted_routing_policy != null && var.policy_type == "weighted" ? [var.weighted_routing_policy] : []
    content {
      weight = lookup(weighted_routing_policy.value, "weight")
    }
  }


  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy

}