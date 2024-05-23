resource "aws_ecr_replication_configuration" "replication_configuration" {

  dynamic "replication_configuration" {
    for_each = var.replication_configuration != null ? [var.replication_configuration] : []
    content {
      dynamic "rule" {
        for_each = lookup(replication_configuration.value, "rule") != null ? [lookup(replication_configuration.value, "rule")] : []
        content {
          dynamic "destination" {
            for_each = lookup(rule.value, "destination") != null ? lookup(rule.value, "destination") : []
            content {
              region      = lookup(destination.value, "region")
              registry_id = lookup(destination.value, "registry_id")

            }
          }

        }
      }
    }
  }
}