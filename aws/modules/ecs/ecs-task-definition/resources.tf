resource "aws_ecs_task_definition" "task" {
  family                   = var.family
  container_definitions    = var.container_definitions
  cpu                      = var.cpu
  execution_role_arn       = var.execution_role_arn
  ipc_mode                 = var.ipc_mode
  memory                   = var.memory
  network_mode             = var.network_mode
  pid_mode                 = var.pid_mode
  requires_compatibilities = var.requires_compatibilities
  tags                     = var.tags
  task_role_arn            = var.task_role_arn

  dynamic "inference_accelerator" {
    for_each = var.inference_accelerator != null ? [var.inference_accelerator] : []

    content {
      device_name = inference_accelerator.value["device_name"]
      device_type = inference_accelerator.value["device_type"]
    }
  }

  dynamic "runtime_platform" {
    for_each = var.runtime_platform != null ? [var.runtime_platform] : []

    content {
      operating_system_family = runtime_platform.value["operating_system_family"]
      cpu_architecture        = runtime_platform.value["cpu_architecture"]
    }
  }

  dynamic "placement_constraints" {
    for_each = var.placement_constraints != null ? [var.placement_constraints] : []

    content {
      expression = placement_constraints.value["expression"]
      type       = placement_constraints.value["type"]
    }
  }

  dynamic "proxy_configuration" {
    for_each = var.proxy_configuration != null ? [var.proxy_configuration] : []

    content {
      container_name = proxy_configuration.value["container_name"]
      properties     = proxy_configuration.value["properties"]
      type           = proxy_configuration.value["type"]
    }
  }

  dynamic "ephemeral_storage" {
    for_each = var.ephemeral_storage != null ? [var.ephemeral_storage] : []

    content {
      size_in_gib = ephemeral_storage.value["size_in_gib"]
    }
  }

  dynamic "volume" {
    for_each = var.volume != null ? [var.volume] : []
    content {
      name      = volume.value["name"]
      host_path = volume.value["host_path"]

      dynamic "docker_volume_configuration" {
        for_each = volume.value.docker_volume_configuration != null ? [volume.value.docker_volume_configuration] : []
        content {
          autoprovision = docker_volume_configuration.value["autoprovision"]
          driver_opts   = docker_volume_configuration.value["driver_opts"]
          driver        = docker_volume_configuration.value["driver"]
          labels        = docker_volume_configuration.value["labels"]
          scope         = docker_volume_configuration.value["scope"]
        }
      }

      dynamic "efs_volume_configuration" {
        for_each = volume.value.efs_volume_configuration != null ? [volume.value.efs_volume_configuration] : []
        content {
          file_system_id          = efs_volume_configuration.value["file_system_id"]
          root_directory          = efs_volume_configuration.value["root_directory"]
          transit_encryption      = efs_volume_configuration.value["transit_encryption"]
          transit_encryption_port = efs_volume_configuration.value["transit_encryption_port"]

          dynamic "authorization_config" {
            for_each = efs_volume_configuration.value.authorization_config != null ? [efs_volume_configuration.value.authorization_config] : []
            content {
              access_point_id = authorization_config.value["access_point_id"]
              iam             = authorization_config.value["iam"]
            }
          }
        }
      }

      dynamic "fsx_windows_file_server_volume_configuration" {
        for_each = volume.value.fsx_windows_file_server_volume_configuration != null ? [volume.value.fsx_windows_file_server_volume_configuration] : []
        content {
          file_system_id = fsx_windows_file_server_volume_configuration.value["file_system_id"]
          root_directory = fsx_windows_file_server_volume_configuration.value["root_directory"]

          dynamic "authorization_config" {
            for_each = fsx_windows_file_server_volume_configuration.value.authorization_config != null ? [fsx_windows_file_server_volume_configuration.value.authorization_config] : []
            content {
              credentials_parameter = authorization_config.value["credentials_parameter"]
              domain                = authorization_config.value["domain"]
            }
          }
        }
      }


    }
  }

}
