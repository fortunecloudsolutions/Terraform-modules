provider "aws" {
  alias  = "perimeter"
  region = "us-west-2"
  access_key = var.aws_perimeter_access_key_id
  secret_key = var.aws_perimeter_secret_access_key
}

provider "aws" {
  alias  = "centralhub"
  region = "us-west-2"
  access_key = var.aws_centralhub_access_key_id
  secret_key = var.aws_centralhub_secret_access_key
}

provider "aws" {
  alias  = "production"
  region = "us-west-2"
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}

provider "aws" {
  alias  = "production_east"
  region = "us-east-1"
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}

provider "aws" {
  alias  = "performance"
  region = "us-west-2"
  access_key = var.aws_performance_access_key_id
  secret_key = var.aws_performance_secret_access_key
}

provider "aws" {
  alias  = "development"
  region = "us-west-2"
  access_key = var.aws_development_access_key_id
  secret_key = var.aws_development_secret_access_key
}
