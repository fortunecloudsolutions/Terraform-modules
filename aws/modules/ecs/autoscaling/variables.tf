

variable "cluster_name" {
  description = "The name of the cluster to create."
  type        = string

}
variable "cluster_minimum_size" {
  description = "The minimum size of the ECS cluster."
  type        = string

}
variable "cluster_maximum_size" {
  description = "The maximum size of the ECS cluster."
  type        = string

}
variable "cluster_desired_capacity" {
  description = "The desired capacity of the ECS cluster."
  type        = string

}
variable "subnet_ids" {
  description = "The IDs of the subnets for container instances."
  type        = list(string)

}
variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)

}
variable "availability_zones" {
  description = " A list of one or more availability zones for the group"
  default     = null
}
variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
  default     = null
}
/*variable mixed_instances_policy {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups"
  default = null

}*/

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health."
  default     = null

}
variable "health_check_type" {
  description = " Controls how health checking is done."
  default     = null

}
variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate."
  default     = null

}
variable "load_balancers" {
  description = " A list of elastic load balancer names to add to the autoscaling group names."
  default     = null

}
variable "target_group_arns" {
  description = "A set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing."
  default     = null
}
variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated."
  default     = null

}
variable "suspended_processes" {
  description = "A list of processes to suspend for the AutoScaling Group."
  default     = null

}
variable "placement_group" {
  description = "The name of the placement group into which you'll launch your instances, if any."
  default     = null
}
variable "metrics_granularity" {
  description = "The granularity to associate with the metrics to collect."
  default     = null

}
variable "enabled_metrics" {
  description = " A list of metrics to collect."
  default     = null

}
variable "wait_for_capacity_timeout" {
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out."
  default     = null

}
variable "min_elb_capacity" {
  description = "Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation. "
  default     = null
}

variable "wait_for_elb_capacity" {
  description = " Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations. "
  default     = null
}
variable "protect_from_scale_in" {
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events."
  default     = null

}
variable "service_linked_role_arn" {
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services"
  default     = null

}
variable "max_instance_lifetime" {
  description = "The maximum amount of time, in seconds, that an instance can be in service"
  default     = null

}