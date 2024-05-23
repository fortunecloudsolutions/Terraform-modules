resource "aws_batch_job_queue" "job_queue" {
  name                 = var.name
  state                = var.state
  priority             = var.priority
  compute_environments = var.compute_environments
  tags                 = var.tags

}