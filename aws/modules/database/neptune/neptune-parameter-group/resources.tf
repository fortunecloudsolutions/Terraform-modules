resource "aws_neptune_parameter_group" "parameter_group" {
  family      = var.family
  name        = var.name
  description = var.description
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