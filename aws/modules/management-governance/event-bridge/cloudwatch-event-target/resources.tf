resource "aws_cloudwatch_event_target" "event_target" {
  target_id      = var.target_id
  rule           = var.rule
  arn            = var.arn
  event_bus_name = var.event_bus_name
  input          = var.input
  input_path     = var.input_path
  role_arn       = var.role_arn


  dynamic "run_command_targets" {
    for_each = var.run_command_targets != null ? var.run_command_targets : []
    content {
      key    = lookup(run_command_targets.value, "key")
      values = lookup(run_command_targets.value, "values")


    }
  }

  dynamic "ecs_target" {
    for_each = var.ecs_target != null ? [var.ecs_target] : []
    content {
      group                   = lookup(ecs_target.value, "group", null)
      launch_type             = lookup(ecs_target.value, "launch_type", null)
      platform_version        = lookup(ecs_target.value, "platform_version", null)
      task_count              = lookup(ecs_target.value, "task_count", null)
      task_definition_arn     = lookup(ecs_target.value, "task_definition_arn")
      tags                    = lookup(ecs_target.value, "tags", null)
      propagate_tags          = lookup(ecs_target.value, "propagate_tags", null)
      enable_execute_command  = lookup(ecs_target.value, "enable_execute_command", null)
      enable_ecs_managed_tags = lookup(ecs_target.value, "enable_ecs_managed_tags", null)
      dynamic "network_configuration" {
        for_each = lookup(ecs_target.value, "network_configuration") != null ? [lookup(ecs_target.value, "network_configuration")] : []
        content {
          subnets          = lookup(network_configuration.value, "subnets")
          security_groups  = lookup(network_configuration.value, "security_groups", null)
          assign_public_ip = lookup(network_configuration.value, "assign_public_ip", null)

        }
      }
      dynamic "placement_constraint" {
        for_each = lookup(ecs_target.value, "placement_constraint") != null ? lookup(ecs_target.value, "placement_constraint") : []
        content {
          type       = lookup(placement_constraint.value, "type")
          expression = lookup(placement_constraint.value, "expression", null)


        }
      }
    }
  }



  dynamic "batch_target" {
    for_each = var.batch_target != null ? [var.batch_target] : []
    content {
      job_definition = lookup(batch_target.value, "job_definition")
      job_name       = lookup(batch_target.value, "job_name")
      array_size     = lookup(batch_target.value, "array_size", null)
      job_attempts   = lookup(batch_target.value, "job_attempts", null)

    }
  }

  dynamic "kinesis_target" {
    for_each = var.kinesis_target != null ? [var.kinesis_target] : []
    content {
      partition_key_path = lookup(kinesis_target.value, "partition_key_path", null)


    }
  }

  dynamic "redshift_target" {
    for_each = var.redshift_target != null ? [var.redshift_target] : []
    content {
      database            = lookup(redshift_target.value, "database")
      db_user             = lookup(redshift_target.value, "db_user", null)
      secrets_manager_arn = lookup(redshift_target.value, "secrets_manager_arn", null)
      sql                 = lookup(redshift_target.value, "sql", null)
      statement_name      = lookup(redshift_target.value, "statement_name", null)
      with_event          = lookup(redshift_target.value, "with_event", null)

    }
  }

  dynamic "sqs_target" {
    for_each = var.sqs_target != null ? [var.sqs_target] : []
    content {
      message_group_id = lookup(sqs_target.value, "message_group_id", null)

    }
  }

  dynamic "http_target" {
    for_each = var.http_target != null ? [var.http_target] : []
    content {
      path_parameter_values   = lookup(http_target.value, "path_parameter_values", null)
      query_string_parameters = lookup(http_target.value, "query_string_parameters", null)
      header_parameters       = lookup(http_target.value, "header_parameters", null)

    }
  }

  dynamic "input_transformer" {
    for_each = var.input_transformer != null ? [var.input_transformer] : []
    content {
      input_paths    = lookup(input_transformer.value, "input_paths", null)
      input_template = lookup(input_transformer.value, "input_template")


    }
  }

  dynamic "retry_policy" {
    for_each = var.retry_policy != null ? [var.retry_policy] : []
    content {
      maximum_event_age_in_seconds = lookup(retry_policy.value, "maximum_event_age_in_seconds", null)
      maximum_retry_attempts       = lookup(retry_policy.value, "maximum_retry_attempts", null)



    }
  }

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config != null ? [var.dead_letter_config] : []
    content {
      arn = lookup(dead_letter_config.value, "arn", null)




    }
  }
}