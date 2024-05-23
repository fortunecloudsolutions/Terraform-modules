locals {
  tag_pairs = var.tags
}

resource "aws_launch_template" "launch_template" {

  name        = var.template_name
  description = var.template_description

  dynamic "block_device_mappings" {
    for_each = var.block_device_mappings
    content {
      device_name  = lookup(block_device_mappings.value, "device_name", null)
      no_device    = lookup(block_device_mappings.value, "no_device", null)
      virtual_name = lookup(block_device_mappings.value, "virtual_name", null)

      dynamic "ebs" {
        for_each = flatten(list(lookup(block_device_mappings.value, "ebs", [])))
        content {
          delete_on_termination = lookup(ebs.value, "delete_on_termination", null)
          encrypted             = lookup(ebs.value, "encrypted", null)
          iops                  = lookup(ebs.value, "iops", null)
          kms_key_id            = lookup(ebs.value, "kms_key_id", null)
          snapshot_id           = lookup(ebs.value, "snapshot_id", null)
          volume_size           = lookup(ebs.value, "volume_size", null)
          volume_type           = lookup(ebs.value, "volume_type", null)
        }
      }
    }
  }

  dynamic "credit_specification" {
    for_each = var.credit_specification != null ? [var.credit_specification] : []
    content {
      cpu_credits = lookup(credit_specification.value, "cpu_credits", null)
    }
  }

  disable_api_termination = var.disable_api_termination
  ebs_optimized           = var.ebs_optimized

  dynamic "elastic_gpu_specifications" {
    for_each = var.elastic_gpu_specifications != null ? [var.elastic_gpu_specifications] : []
    content {
      type = lookup(elastic_gpu_specifications.value, "typ", null)
    }
  }

  dynamic "elastic_inference_accelerator" {
    for_each = var.elastic_inference_accelerator != null ? [var.elastic_inference_accelerator] : []
    content {
      type = lookup(elastic_inference_accelerator.value, "typ", null)
    }
  }

  iam_instance_profile {
    arn  = var.iam_instance_profile_arn != null ? var.iam_instance_profile_arn : null
    name = var.iam_instance_profile_name != null ? var.iam_instance_profile_name : null
  }

  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  dynamic "instance_market_options" {
    for_each = var.instance_market_options != null ? [var.instance_market_options] : []
    content {
      market_type = lookup(instance_market_options.value, "market_type", null)

      dynamic "spot_options" {
        for_each = (instance_market_options.value.spot_options != null ?
        [instance_market_options.value.spot_options] : [])
        content {
          block_duration_minutes         = lookup(spot_options.value, "block_duration_minutes", null)
          instance_interruption_behavior = lookup(spot_options.value, "instance_interruption_behavior", null)
          max_price                      = lookup(spot_options.value, "max_price", null)
          spot_instance_type             = lookup(spot_options.value, "spot_instance_type", null)
          valid_until                    = lookup(spot_options.value, "valid_until", null)
        }
      }
    }
  }

  instance_type = var.instance_type
  kernel_id     = var.kernel_id
  key_name      = var.key_name

  dynamic "license_specification" {
    for_each = var.license_specification != null ? [var.license_specification] : []
    content {
      license_configuration_arn = lookup(license_specification.value, "arn", null)
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options != null ? [var.metadata_options] : []
    content {
      http_endpoint               = lookup(metadata_options.value, "http_endpoint", "enabled")
      http_tokens                 = lookup(metadata_options.value, "http_tokens", "optional")
      http_put_response_hop_limit = lookup(metadata_options.value, "http_put_response_hop_limit", 1)
    }
  }

  monitoring {
    enabled = var.enable_monitoring
  }

  dynamic "network_interfaces" {
    for_each = var.network_interfaces != null ? [var.network_interfaces] : []
    content {
      description                 = lookup(network_interfaces.value, "ni_description")
      device_index                = lookup(network_interfaces.value, "device_index")
      associate_public_ip_address = lookup(network_interfaces.value, "associate_public_ip_address", true)
      delete_on_termination       = lookup(network_interfaces.value, "delete_on_termination", true)
      security_groups             = lookup(network_interfaces.value, "security_groups")
      subnet_id                   = lookup(network_interfaces.value, "subnet_id")
    }
  }

  dynamic "placement" {
    for_each = var.placement != null ? [var.placement] : []
    content {
      affinity          = lookup(placement.value, "affinity", null)
      availability_zone = lookup(placement.value, "availability_zone", null)
      group_name        = lookup(placement.value, "group_name", null)
      host_id           = lookup(placement.value, "host_id", null)
      tenancy           = lookup(placement.value, "tenancy", null)
    }
  }

  ram_disk_id = var.ram_disk_id

  vpc_security_group_ids = var.vpc_security_group_ids

  dynamic "tag_specifications" {
    for_each = var.tag_specifications != null ? [var.tag_specifications] : []
    content {
      resource_type = lookup(tag_specifications.value, "resource_type", null)
      tags          = lookup(tag_specifications.value, "tags", null)
    }
  }

  tags = local.tag_pairs

  user_data = var.user_data != null ? base64encode(var.user_data) : null

  dynamic "hibernation_options" {
    for_each = var.hibernation_options != null ? [var.hibernation_options] : []
    content {
      configured = lookup(hibernation_options.value, "configured", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}

