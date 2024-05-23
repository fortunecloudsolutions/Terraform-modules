# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an AutoScaling Group resource.

# Inputs

| Name | Description |
| ------------- | ------------- |
|  cluster_name | The name of the cluster to create. |
|  cluster_minimum_size | The minimum size of the ECS cluster. |
|  cluster_maximum_size | The maximum size of the ECS cluster. |
|  cluster_desired_capacity | The desired capacity of the ECS cluster. |
|  subnet_ids | The IDs of the subnets for container instances. |
|  custom_tags | Custom tags to set on the Instances in the ASG |
|  availability_zones |  A list of one or more availability zones for the group |
|  default_cooldown | The amount of time, in seconds, after a scaling activity completes before another scaling activity can start |
|  health_check_grace_period | Time (in seconds) after instance comes into service before checking health. |
|  health_check_type  |  Controls how health checking is done. |
|  force_delete | Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. |
|  load_balancers |  A list of elastic load balancer names to add to the autoscaling group names. |
|  target_group_arns | A set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing. |
|  termination_policies | A list of policies to decide how the instances in the auto scale group should be terminated. |
|  suspended_processes | A list of processes to suspend for the AutoScaling Group. |
|  placement_group | The name of the placement group into which you'll launch your instances, if any. |
|  metrics_granularity | The granularity to associate with the metrics to collect. |
|  enabled_metrics |  A list of metrics to collect. |
|  wait_for_capacity_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. |
|  min_elb_capacity | Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation.  |
|  wait_for_elb_capacity |  Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations.  |
|  protect_from_scale_in | Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events. |
|  service_linked_role_arn | The ARN of the service-linked role that the ASG will use to call other AWS services |
|  max_instance_lifetime | The maximum amount of time, in seconds, that an instance can be in service |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  autoscaling_group_name |The name of the autoscaling group for the ECS container instances. |