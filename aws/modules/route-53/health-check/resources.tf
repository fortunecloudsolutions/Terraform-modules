
locals {
  tag_pairs = var.tags
}

resource "aws_route53_health_check" "health_check" {
  reference_name                  = var.reference_name
  fqdn                            = var.endpoint != null ? lookup(var.endpoint, "fully_qualified_domain_name", null) : null
  ip_address                      = var.endpoint != null ? lookup(var.endpoint, "ip_address", null) : null
  port                            = var.endpoint != null ? lookup(var.endpoint, "port", null) : null
  type                            = var.type
  failure_threshold               = var.endpoint != null ? lookup(var.endpoint, "failure_threshold", null) : null
  request_interval                = var.endpoint != null ? lookup(var.endpoint, "request_interval", null) : null
  resource_path                   = var.endpoint != null ? lookup(var.endpoint, "resource_path", null) : null
  search_string                   = var.endpoint != null ? lookup(var.endpoint, "search_string", null) : null
  measure_latency                 = var.endpoint != null ? lookup(var.endpoint, "measure_latency", null) : null
  invert_healthcheck              = var.invert_healthcheck
  disabled                        = var.disabled
  child_healthchecks              = var.calculated_health_check != null ? lookup(var.calculated_health_check, "child_healthchecks", null) : null
  child_health_threshold          = var.calculated_health_check != null ? lookup(var.calculated_health_check, "child_health_threshold", null) : null
  cloudwatch_alarm_name           = var.cloudwatch != null ? lookup(var.cloudwatch, "cloudwatch_alarm_name", null) : null
  cloudwatch_alarm_region         = var.cloudwatch != null ? lookup(var.cloudwatch, "cloudwatch_alarm_region", null) : null
  insufficient_data_health_status = var.cloudwatch != null ? lookup(var.cloudwatch, "insufficient_data_health_status", null) : null
  regions                         = var.endpoint != null ? lookup(var.endpoint, "regions", null) : null
  tags                            = local.tag_pairs
}