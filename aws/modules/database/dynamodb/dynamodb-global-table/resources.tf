resource "aws_dynamodb_global_table" "global_table" {
  name = var.name
  dynamic "replica" {
    for_each = var.replica != null ? var.replica : []
    content {
      region_name = lookup(replica.value, "region_name")

    }
  }

}