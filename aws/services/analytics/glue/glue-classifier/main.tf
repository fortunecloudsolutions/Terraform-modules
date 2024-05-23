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


module "classifier" {
  source          = "../../../../modules/analytics/glue/glue-classifier"
  name            = var.name
  csv_classifier  = var.csv_classifier
  grok_classifier = var.grok_classifier
  json_classifier = var.json_classifier
  xml_classifier  = var.xml_classifier

}