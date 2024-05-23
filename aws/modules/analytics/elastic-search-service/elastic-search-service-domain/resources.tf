resource "aws_elasticsearch_domain" "domain" {
  domain_name           = var.domain_name
  access_policies       = var.access_policies
  advanced_options      = var.advanced_options
  elasticsearch_version = var.elasticsearch_version
  tags                  = var.tags

  dynamic "advanced_security_options" {
    for_each = var.advanced_security_options != null ? [var.advanced_security_options] : []
    content {
      enabled                        = lookup(advanced_security_options.value, "enabled")
      internal_user_database_enabled = lookup(advanced_security_options.value, "internal_user_database_enabled", false)
      dynamic "master_user_options" {
        for_each = lookup(advanced_security_options.value, "master_user_options") != null ? [lookup(advanced_security_options.value, "master_user_options")] : []
        content {
          master_user_arn      = lookup(master_user_options.value, "master_user_arn", null)
          master_user_name     = lookup(master_user_options.value, "master_user_name", null)
          master_user_password = lookup(master_user_options.value, "master_user_password", null)


        }
      }
    }
  }


  dynamic "cluster_config" {
    for_each = var.cluster_config != null ? [var.cluster_config] : []
    content {
      dedicated_master_count   = lookup(cluster_config.value, "dedicated_master_count", null)
      dedicated_master_enabled = lookup(cluster_config.value, "dedicated_master_enabled", false)
      dedicated_master_type    = lookup(cluster_config.value, "dedicated_master_type", null)
      instance_count           = lookup(cluster_config.value, "instance_count", null)
      instance_type            = lookup(cluster_config.value, "instance_type", null)
      warm_count               = lookup(cluster_config.value, "warm_count", null)
      warm_enabled             = lookup(cluster_config.value, "warm_enabled", null)
      warm_type                = lookup(cluster_config.value, "warm_type", null)
      zone_awareness_enabled   = lookup(cluster_config.value, "zone_awareness_enabled", null)

      dynamic "zone_awareness_config" {
        for_each = lookup(cluster_config.value, "zone_awareness_config") != null ? [lookup(cluster_config.value, "zone_awareness_config")] : []
        content {
          availability_zone_count = lookup(zone_awareness_config.value, "availability_zone_count", 2)

        }
      }

    }
  }

  dynamic "cognito_options" {
    for_each = var.cognito_options != null ? [var.cognito_options] : []
    content {
      enabled          = lookup(cognito_options.value, "enabled", false)
      identity_pool_id = lookup(cognito_options.value, "identity_pool_id")
      role_arn         = lookup(cognito_options.value, "role_arn")
      user_pool_id     = lookup(cognito_options.value, "user_pool_id")

    }
  }

  dynamic "domain_endpoint_options" {
    for_each = var.domain_endpoint_options != null ? [var.domain_endpoint_options] : []
    content {
      custom_endpoint_certificate_arn = lookup(domain_endpoint_options.value, "custom_endpoint_certificate_arn", null)
      custom_endpoint_enabled         = lookup(domain_endpoint_options.value, "custom_endpoint_enabled", null)
      custom_endpoint                 = lookup(domain_endpoint_options.value, "custom_endpoint", null)
      enforce_https                   = lookup(domain_endpoint_options.value, "enforce_https", true)
      tls_security_policy             = lookup(domain_endpoint_options.value, "tls_security_policy", null)


    }
  }

  dynamic "ebs_options" {
    for_each = var.ebs_options != null ? [var.ebs_options] : []
    content {
      ebs_enabled = lookup(ebs_options.value, "ebs_enabled")
      iops        = lookup(ebs_options.value, "iops", null)
      volume_size = lookup(ebs_options.value, "volume_size")
      volume_type = lookup(ebs_options.value, "volume_type", null)

    }
  }

  dynamic "encrypt_at_rest" {
    for_each = var.encrypt_at_rest != null ? [var.encrypt_at_rest] : []
    content {
      enabled    = lookup(encrypt_at_rest.value, "enabled")
      kms_key_id = lookup(encrypt_at_rest.value, "kms_key_id", null)

    }
  }

  dynamic "log_publishing_options" {
    for_each = var.log_publishing_options != null ? [var.log_publishing_options] : []
    content {
      cloudwatch_log_group_arn = lookup(log_publishing_options.value, "cloudwatch_log_group_arn")
      enabled                  = lookup(log_publishing_options.value, "enabled", true)
      log_type                 = lookup(log_publishing_options.value, "log_type")
    }
  }

  dynamic "node_to_node_encryption" {
    for_each = var.node_to_node_encryption != null ? [var.node_to_node_encryption] : []
    content {
      enabled = lookup(node_to_node_encryption.value, "enabled")

    }
  }

  dynamic "snapshot_options" {
    for_each = var.snapshot_options != null ? [var.snapshot_options] : []
    content {
      automated_snapshot_start_hour = lookup(snapshot_options.value, "automated_snapshot_start_hour")

    }
  }

  dynamic "vpc_options" {
    for_each = var.vpc_options != null ? [var.vpc_options] : []
    content {
      security_group_ids = lookup(vpc_options.value, "security_group_ids", null)
      subnet_ids         = lookup(vpc_options.value, "subnet_ids")


    }
  }

  timeouts {
    update = lookup(var.timeouts, "update", "60m")
  }

}