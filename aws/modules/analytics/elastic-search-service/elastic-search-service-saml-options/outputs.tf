output "id" {
  description = "The name of the domain the SAML options are associated with."
  value       = aws_elasticsearch_domain_saml_options.saml_options.id
}
