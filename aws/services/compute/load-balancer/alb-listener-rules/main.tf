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

module "alb_listnr_rule" {
  source                    = "../../../../modules/load-balancer/alb-listener-rules"
  number_of_listener_rules  = var.number_of_listener_rules
  listener_arn              = var.listener_arn
  listener_priority         = var.listener_priority
  routing_action_type       = var.routing_action_type
  single_fwd_target_grp_arn = var.single_fwd_target_grp_arn
  forward                   = var.forward
  redirect                  = var.redirect
  fixed_response            = var.fixed_response
  authenticate_cognito      = var.authenticate_cognito
  authenticate_oidc         = var.authenticate_oidc
  condition                 = var.condition
}