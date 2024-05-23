
resource "aws_ecs_task_definition" "task" {
  family                   = var.family
  container_definitions    = var.container_definitions
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.execution_role_arn
  network_mode             = var.network_mode
  ipc_mode                 = var.ipc_mode
  pid_mode                 = var.pid_mode
  cpu                      = var.cpu
  memory                   = var.memory
  requires_compatibilities = var.requires_compatibilities
  #proxy_configuration = var.proxy_configuration
  #inference_accelerator = var.inference_accelerator
}
