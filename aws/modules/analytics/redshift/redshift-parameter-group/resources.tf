resource "aws_redshift_parameter_group" "parameter_group" {
  name        = var.name
  family      = var.family
  description = var.description

  dynamic "parameter" {
    for_each = var.parameter != null ? var.parameter : []
    content {
      name  = lookup(parameter.value, "name")
      value = lookup(parameter.value, "value")

    }
  }

}