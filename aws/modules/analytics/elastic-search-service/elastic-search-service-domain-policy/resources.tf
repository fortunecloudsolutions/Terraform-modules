resource "aws_elasticsearch_domain_policy" "domain_policy" {
  domain_name     = var.domain_name
  access_policies = var.access_policies

}