resource "aws_lambda_layer_version" "lambda_layer" {
  filename            = var.filename
  layer_name          = var.layer_name
  compatible_runtimes = var.compatible_runtimes
  s3_bucket           = var.s3_bucket
  s3_key              = var.s3_key
  s3_object_version   = var.s3_object_version
  description         = var.description
  license_info        = var.license_info
  source_code_hash    = var.source_code_hash

}
