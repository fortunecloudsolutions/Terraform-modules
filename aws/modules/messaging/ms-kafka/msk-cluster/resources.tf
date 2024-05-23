resource "aws_msk_cluster" "msk" {
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = var.enhanced_monitoring
  tags                   = var.tags

  dynamic "broker_node_group_info" {
    for_each = [var.broker_node_group_info]
    content {
      instance_type   = lookup(broker_node_group_info.value, "instance_type")
      ebs_volume_size = lookup(broker_node_group_info.value, "ebs_volume_size")
      client_subnets  = lookup(broker_node_group_info.value, "client_subnets")
      security_groups = lookup(broker_node_group_info.value, "security_groups")
      az_distribution = lookup(broker_node_group_info.value, "az_distribution")
    }
  }

  dynamic "configuration_info" {
    for_each = var.configuration_info != null ? [var.configuration_info] : []
    content {
      arn      = lookup(configuration_info.value, "arn")      #aws_msk_configuration.config[0].arn
      revision = lookup(configuration_info.value, "revision") #aws_msk_configuration.config[0].latest_revision
    }
  }

  dynamic "encryption_info" {
    for_each = var.encryption_info != null ? [var.encryption_info] : []
    content {
      encryption_at_rest_kms_key_arn = lookup(encryption_info.value, "encryption_at_rest_kms_key_arn", null)

      dynamic "encryption_in_transit" {
        for_each = (lookup(encryption_info.value, "encryption_in_transit", null) != null ?
        [lookup(encryption_info.value, "encryption_in_transit")] : [])
        content {
          client_broker = encryption_in_transit.value["client_broker"]
          in_cluster    = encryption_in_transit.value["in_cluster"]
        }
      }
    }
  }

  dynamic "client_authentication" {
    for_each = var.client_authentication != null ? [var.client_authentication] : []
    content {

      dynamic "tls" {

        for_each = (lookup(client_authentication.value, "tls", null) != null ?
        [lookup(client_authentication.value, "tls")] : [])
        content {
          certificate_authority_arns = lookup(tls.value, "certificate_authority_arns", null)
        }
      }

      dynamic "sasl" {

        for_each = (lookup(client_authentication.value, "sasl", null) != null ?
        [lookup(client_authentication.value, "sasl")] : [])
        content {
          scram = lookup(sasl.value, "scram", false)
        }
      }

    }
  }

  dynamic "open_monitoring" {

    for_each = var.open_monitoring != null ? [var.open_monitoring] : []
    content {

      dynamic "prometheus" {
        for_each = [lookup(open_monitoring.value, "prometheus")]
        content {

          dynamic "jmx_exporter" {
            for_each = (lookup(prometheus.value, "jmx_exporter", null) != null ?
            [lookup(prometheus.value, "jmx_exporter")] : [])
            content {
              enabled_in_broker = jmx_exporter.value["enabled_in_broker"]
            }
          }

          dynamic "node_exporter" {
            for_each = (lookup(prometheus.value, "node_exporter", null) != null ?
            [lookup(prometheus.value, "node_exporter")] : [])
            content {
              enabled_in_broker = node_exporter.value["enabled_in_broker"]
            }
          }
        }

      }
    }
  }

  dynamic "logging_info" {
    for_each = var.logging_info != null ? [var.logging_info] : []
    content {

      dynamic "broker_logs" {
        for_each = [lookup(logging_info.value, "broker_logs")]
        content {

          dynamic "cloudwatch_logs" {
            for_each = (lookup(broker_logs.value, "cloudwatch_logs", null) != null ?
            [lookup(broker_logs.value, "cloudwatch_logs")] : [])
            content {
              enabled   = cloudwatch_logs.value["enabled"]
              log_group = cloudwatch_logs.value["log_group"]
            }
          }

          dynamic "firehose" {
            for_each = (lookup(broker_logs.value, "firehose", null) != null ?
            [lookup(broker_logs.value, "firehose")] : [])
            content {
              enabled         = firehose.value["enabled"]
              delivery_stream = firehose.value["delivery_stream"]
            }
          }

          dynamic "s3" {
            for_each = (lookup(broker_logs.value, "s3", null) != null ?
            [lookup(broker_logs.value, "s3")] : [])
            content {
              enabled = s3.value["enabled"]
              bucket  = s3.value["bucket"]
              prefix  = s3.value["prefix"]
            }
          }

        }
      }
    }

  }
}
