resource "aws_redshift_security_group" "security_group" {
  name        = var.name
  description = var.description

  dynamic "ingress" {
    for_each = var.ingress != null ? var.ingress : []
    content {
      cidr                    = lookup(ingress.value, "cidr", null)
      security_group_name     = lookup(ingress.value, "security_group_name", null)
      security_group_owner_id = lookup(ingress.value, "security_group_owner_id", null)


    }
  }

}