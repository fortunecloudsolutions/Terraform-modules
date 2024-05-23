resource "aws_dynamodb_table" "table" {
  name             = var.name
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  hash_key         = var.hash_key
  range_key        = var.range_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  tags             = var.tags

  dynamic "attribute" {
    for_each = var.attribute != null ? var.attribute : []
    content {
      name = lookup(attribute.value, "name")
      type = lookup(attribute.value, "type")
    }
  }

  dynamic "ttl" {
    for_each = var.ttl != null ? [var.ttl] : []
    content {
      enabled        = lookup(ttl.value, "enabled")
      attribute_name = lookup(ttl.value, "attribute_name")
    }
  }

  dynamic "local_secondary_index" {
    for_each = var.local_secondary_index != null ? var.local_secondary_index : []
    content {
      name               = lookup(local_secondary_index.value, "name")
      range_key          = lookup(local_secondary_index.value, "range_key")
      projection_type    = lookup(local_secondary_index.value, "projection_type")
      non_key_attributes = lookup(local_secondary_index.value, "non_key_attributes", null)


    }
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_index != null ? var.global_secondary_index : []
    content {
      name               = lookup(global_secondary_index.value, "name")
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
      hash_key           = lookup(global_secondary_index.value, "hash_key")
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      projection_type    = lookup(global_secondary_index.value, "projection_type")
      non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes")


    }
  }

  dynamic "replica" {
    for_each = var.replica != null ? var.replica : []
    content {
      region_name = lookup(replica.value, "region_name")
      kms_key_arn = lookup(replica.value, "kms_key_arn", null)

    }
  }

  dynamic "server_side_encryption" {
    for_each = var.server_side_encryption != null ? [var.server_side_encryption] : []
    content {
      enabled     = lookup(server_side_encryption.value, "enabled")
      kms_key_arn = lookup(server_side_encryption.value, "kms_key_arn", null)

    }
  }

  dynamic "point_in_time_recovery" {
    for_each = var.point_in_time_recovery != null ? [var.point_in_time_recovery] : []
    content {
      enabled = lookup(point_in_time_recovery.value, "enabled")

    }
  }


  timeouts {
    create = lookup(var.timeouts, "create", "10m")
    update = lookup(var.timeouts, "update", "60m")
    delete = lookup(var.timeouts, "delete", "10m")
  }








}