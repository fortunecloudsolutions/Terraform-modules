resource "aws_batch_compute_environment" "compute_environment" {
  compute_environment_name        = var.compute_environment_name
  compute_environment_name_prefix = var.compute_environment_name_prefix
  service_role                    = var.service_role
  state                           = var.state
  tags                            = var.tags
  type                            = var.type

  dynamic "compute_resources" {
    for_each = var.compute_resources != null ? [var.compute_resources] : []
    content {
      allocation_strategy = lookup(compute_resources.value, "allocation_strategy", null)
      bid_percentage      = lookup(compute_resources.value, "bid_percentage", null)
      desired_vcpus       = lookup(compute_resources.value, "desired_vcpus", null)
      image_id            = lookup(compute_resources.value, "image_id", null)
      ec2_key_pair        = lookup(compute_resources.value, "ec2_key_pair", null)
      instance_type       = lookup(compute_resources.value, "instance_type", null)
      instance_role       = lookup(compute_resources.value, "instance_role", null)
      max_vcpus           = lookup(compute_resources.value, "max_vcpus")
      min_vcpus           = lookup(compute_resources.value, "min_vcpus", null)
      security_group_ids  = lookup(compute_resources.value, "security_group_ids", null)
      spot_iam_fleet_role = lookup(compute_resources.value, "spot_iam_fleet_role", null)
      subnets             = lookup(compute_resources.value, "subnets")
      tags                = lookup(compute_resources.value, "tags", null)
      type                = lookup(compute_resources.value, "type", null)

      dynamic "ec2_configuration" {
        for_each = lookup(compute_resources.value, "ec2_configuration") != null ? [lookup(compute_resources.value, "ec2_configuration")] : []
        content {
          image_id_override = lookup(ec2_configuration.value, "image_id_override", null)
          image_type        = lookup(ec2_configuration.value, "image_type", null)
        }
      }

      dynamic "launch_template" {
        for_each = lookup(compute_resources.value, "launch_template") != null ? [lookup(compute_resources.value, "launch_template")] : []
        content {
          launch_template_id   = lookup(launch_template.value, "launch_template_id", null)
          launch_template_name = lookup(launch_template.value, "launch_template_name", null)
          version              = lookup(launch_template.value, "version", null)

        }
      }
    }
  }


}