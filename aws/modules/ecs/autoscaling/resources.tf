resource "aws_autoscaling_group" "cluster" {
  name_prefix = "asg-${var.cluster_name}-"

  vpc_zone_identifier = var.subnet_ids

  launch_configuration = var.cluster_name

  min_size           = var.cluster_minimum_size
  max_size           = var.cluster_maximum_size
  desired_capacity   = var.cluster_desired_capacity
  availability_zones = var.availability_zones
  default_cooldown   = var.default_cooldown
  #mixed_instances_policy = var.mixed_instances_policy
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  force_delete              = var.force_delete
  load_balancers            = var.load_balancers
  target_group_arns         = var.target_group_arns
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  placement_group           = var.placement_group
  metrics_granularity       = var.metrics_granularity
  enabled_metrics           = var.enabled_metrics
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  max_instance_lifetime     = var.max_instance_lifetime

  dynamic "tag" {
    for_each = var.custom_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}
