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

module "nlb_listener" {
  source                    = "../../../../modules/load-balancer/nlb-listener"
  load_balancer_arn         = var.load_balancer_arn
  listener_port             = var.listener_port
  listener_protocol         = var.listener_protocol
  ssl_policy                = var.ssl_policy
  certificate_arn           = var.certificate_arn
  routing_action_type       = var.routing_action_type
  single_fwd_target_grp_arn = var.single_fwd_target_grp_arn
  forward                   = var.forward
  redirect                  = var.redirect
  fixed_response            = var.fixed_response
  authenticate_cognito      = var.authenticate_cognito
  authenticate_oidc         = var.authenticate_oidc
}
