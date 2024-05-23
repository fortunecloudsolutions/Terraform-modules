resource "aws_glue_connection" "connection" {
  connection_properties = var.connection_properties
  name                  = var.name
  connection_type       = var.connection_type
  description           = var.description
  match_criteria        = var.match_criteria

  dynamic "physical_connection_requirements" {
    for_each = var.physical_connection_requirements != null ? [var.physical_connection_requirements] : []
    content {
      availability_zone      = lookup(physical_connection_requirements.value, "availability_zone", null)
      security_group_id_list = lookup(physical_connection_requirements.value, "security_group_id_list", null)
      subnet_id              = lookup(physical_connection_requirements.value, "subnet_id", null)


    }
  }
}
