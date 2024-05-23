provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}

provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

module "record" {
  source                           = "../../../modules/route-53/record"
  zone_id                          = var.zone_id
  name                             = var.name
  type                             = var.type
  ttl                              = var.ttl
  records                          = var.records
  alias                            = var.alias
  set_identifier                   = var.set_identifier
  policy_type                      = var.policy_type
  health_check_id                  = var.health_check_id
  failover_routing_policy          = var.failover_routing_policy
  geolocation_routing_policy       = var.geolocation_routing_policy
  latency_routing_policy           = var.latency_routing_policy
  weighted_routing_policy          = var.weighted_routing_policy
  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
}