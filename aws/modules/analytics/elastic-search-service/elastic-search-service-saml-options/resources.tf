resource "aws_elasticsearch_domain_saml_options" "saml_options" {
  domain_name = var.domain_name

  dynamic "saml_options" {
    for_each = var.saml_options != null ? [var.saml_options] : []
    content {
      enabled                 = lookup(saml_options.value, "enabled")
      master_backend_role     = lookup(saml_options.value, "master_backend_role")
      master_user_name        = lookup(saml_options.value, "master_user_name")
      roles_key               = lookup(saml_options.value, "roles_key")
      session_timeout_minutes = lookup(saml_options.value, "session_timeout_minutes")
      subject_key             = lookup(saml_options.value, "subject_key")
      dynamic "idp" {
        for_each = lookup(saml_options.value, "idp") != null ? [lookup(saml_options.value, "idp")] : []
        content {
          entity_id        = lookup(idp.value, "entity_id")
          metadata_content = lookup(idp.value, "metadata_content")



        }
      }
    }
  }



}