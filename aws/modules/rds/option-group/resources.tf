resource "aws_db_option_group" "rds" {
  name                     = var.name
  option_group_description = var.option_group_description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  dynamic "option" {
    for_each = var.options != null ? var.options : []
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = option.value.option_settings != null ? option.value.option_settings : []
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }
  tags = var.tags

  timeouts {
    delete = lookup(var.timeouts, "delete", null)
  }


  lifecycle {
    create_before_destroy = true
  }


}
