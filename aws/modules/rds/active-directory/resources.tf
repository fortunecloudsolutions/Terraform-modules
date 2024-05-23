resource "aws_directory_service_directory" "rds_ad" {
  name       = var.name
  password   = var.password
  enable_sso = var.enable_sso
  edition    = var.edition
  short_name = var.short_name
  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.subnet_ids
  }
  type = var.dir_type
  size = var.size
}
