aws_perimeter_access_key_id       = "YOUR_AWS_PERIMETER_ACCESS_KEY_ID"
aws_perimeter_secret_access_key   = "YOUR_AWS_PERIMETER_SECRET_ACCESS_KEY"
aws_centralhub_access_key_id      = "YOUR_AWS_CENTRALHUB_ACCESS_KEY_ID"
aws_centralhub_secret_access_key  = "YOUR_AWS_CENTRALHUB_SECRET_ACCESS_KEY"
aws_production_access_key_id      = "YOUR_AWS_PRODUCTION_ACCESS_KEY_ID"
aws_production_secret_access_key  = "YOUR_AWS_PRODUCTION_SECRET_ACCESS_KEY"
aws_performance_access_key_id     = "YOUR_AWS_PERFORMANCE_ACCESS_KEY_ID"
aws_performance_secret_access_key = "YOUR_AWS_PERFORMANCE_SECRET_ACCESS_KEY"
aws_development_access_key_id     = "YOUR_AWS_DEVELOPMENT_ACCESS_KEY_ID"
aws_development_secret_access_key = "YOUR_AWS_DEVELOPMENT_SECRET_ACCESS_KEY"

vpc_cidr_blocks = {
  perimeter = {
    vpc1 = "10.0.0.0/16"
    vpc2 = "10.1.0.0/16"
  }
  centralhub = {
    vpc1 = "10.2.0.0/16"
  }
}

availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
