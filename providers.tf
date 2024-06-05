provider "aws" {
  alias  = "perimeter"
  region = var.aws_region_perimeter
  access_key = var.aws_perimeter_access_key_id
  secret_key = var.aws_perimeter_secret_access_key
}

provider "aws" {
  alias  = "centralhub"
  region = var.aws_region_centralhub
  access_key = var.aws_centralhub_access_key_id
  secret_key = var.aws_centralhub_secret_access_key
}

provider "aws" {
  alias  = "production"
  region = var.aws_region_production
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}

provider "aws" {
  alias  = "production_east"
  region = var.aws_region_production_east
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}

provider "aws" {
  alias  = "performance"
  region = var.aws_region_performance
  access_key = var.aws_performance_access_key_id
  secret_key = var.aws_performance_secret_access_key
}

provider "aws" {
  alias  = "development"
  region = var.aws_region_development
  access_key = var.aws_development_access_key_id
  secret_key = var.aws_development_secret_access_key
}
