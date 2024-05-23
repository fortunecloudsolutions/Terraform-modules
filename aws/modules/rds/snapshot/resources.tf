resource "aws_db_snapshot" "backup" {
  count                  = length(var.db_instance_identifier)
  db_instance_identifier = element(var.db_instance_identifier, count.index)
  db_snapshot_identifier = "${var.db_snapshot_identifier}${count.index}"
  tags                   = var.tags
}
