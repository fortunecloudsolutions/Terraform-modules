provider "aws" {
  alias  = "production"
  region = "us-west-2"
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}
