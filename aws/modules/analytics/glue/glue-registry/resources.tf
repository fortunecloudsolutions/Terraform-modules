resource "aws_glue_registry" "registry" {
  registry_name = var.registry_name
  description   = var.description
  tags          = var.tags
}
