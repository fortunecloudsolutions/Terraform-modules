resource "aws_redshift_snapshot_schedule_association" "snapshot_schedule_association" {
  cluster_identifier  = var.cluster_identifier
  schedule_identifier = var.schedule_identifier
}