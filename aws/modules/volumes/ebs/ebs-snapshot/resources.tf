resource "aws_ebs_snapshot" "snapshot" {

  volume_id   = var.volume_id
  description = var.description
  tags        = var.tags
}