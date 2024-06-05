provider "aws" {
  alias  = "production"
  region = var.aws_region
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}
