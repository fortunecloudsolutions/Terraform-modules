resource "aws_neptune_subnet_group" "subnet_group" {
  name        = var.name
  name_prefix = var.name_prefix
  description = var.description
  subnet_ids  = var.subnet_ids
  tags        = var.tags
}