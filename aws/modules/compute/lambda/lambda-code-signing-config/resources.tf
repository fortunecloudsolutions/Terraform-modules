resource "aws_lambda_code_signing_config" "lambda_csc" {

  dynamic "allowed_publishers" {
    for_each = var.allowed_publishers != null ? [var.allowed_publishers] : []
    content {

      signing_profile_version_arns = lookup(allowed_publishers.value, "signing_profile_version_arns")
    }
  }

  dynamic "policies" {
    for_each = var.policies != null ? [var.policies] : []
    content {

      untrusted_artifact_on_deployment = lookup(policies.value, "untrusted_artifact_on_deployment")
    }
  }

  description = var.description
}