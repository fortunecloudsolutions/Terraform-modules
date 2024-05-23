resource "aws_neptune_cluster_parameter_group" "cluster_parameter_group" {
  family      = var.family
  name        = var.name
  description = var.description
  name_prefix = var.name_prefix
  tags        = var.tags

  dynamic "parameter" {
    for_each = var.parameter != null ? var.parameter : []
    content {
      name         = lookup(parameter.value, "name")
      value        = lookup(parameter.value, "value")
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }
  

}