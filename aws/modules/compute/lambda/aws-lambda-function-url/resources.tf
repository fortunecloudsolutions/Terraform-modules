resource "aws_lambda_function_url" "test_latest" {
  function_name      = var.function_name
  authorization_type = var.authorization_type


  dynamic "cors" {
    for_each = var.cors != null ? [var.cors] : []
    content {
      allow_credentials = lookup(cors.value, "allow_credentials")
      allow_origins     = lookup(cors.value, "allow_origins")
      allow_methods     = lookup(cors.value, "allow_methods")
      allow_headers     = lookup(cors.value, "allow_headers")
      expose_headers    = lookup(cors.value, "expose_headers")
      max_age           = lookup(cors.value, "max_age")


    }
  }

}