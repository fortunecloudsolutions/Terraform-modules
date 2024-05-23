resource "aws_neptune_cluster_snapshot" "cluster_snapshot" {
  db_cluster_identifier          = var.db_cluster_identifier
  db_cluster_snapshot_identifier = var.db_cluster_snapshot_identifier
  timeouts {
    create = lookup(var.timeouts, "create", "20m")
  }
}