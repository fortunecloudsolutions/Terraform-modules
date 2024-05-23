resource "aws_iam_role" "role" {
  name                  = var.name
  assume_role_policy    = var.role_policy
  force_detach_policies = var.force_detach_policies
  path                  = var.path
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  tags                  = var.tags
}
