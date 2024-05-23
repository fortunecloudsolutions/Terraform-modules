resource "aws_acm_certificate" "cert" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method

  dynamic "options" {
    for_each = var.options != null ? [var.options] : []
    content {
      certificate_transparency_logging_preference = lookup(certificate_transparency_logging_preference.value, "certificate_transparency_logging_preference")
    }
  }

  # Importing an existing certificate
  private_key       = var.private_key
  certificate_body  = var.certificate_body
  certificate_chain = var.certificate_chain

  # Creating a private CA issued certificate
  certificate_authority_arn = var.certificate_authority_arn

  tags = var.tags

}

