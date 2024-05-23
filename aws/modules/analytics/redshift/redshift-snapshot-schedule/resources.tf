resource "aws_redshift_snapshot_schedule" "snapshot_schedule" {
  identifier        = var.identifier
  identifier_prefix = var.identifier_prefix
  description       = var.description
  force_destroy     = var.force_destroy
  definitions       = var.definitions
  tags              = var.tags

}
