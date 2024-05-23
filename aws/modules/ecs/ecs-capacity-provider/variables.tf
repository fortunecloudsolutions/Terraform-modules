

variable "name" {
  description = "(Required) Name of the capacity provider"
  type        = string
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags. If configured with a provider"
  type        = map(string)
  default = null
}


variable "auto_scaling_group_provider" {
    description = "(Required) Configuration block for the provider for the ECS auto scaling group. Detailed below."
    type = object({
      auto_scaling_group_arn         = string # (Required)  ARN of the associated auto scaling group.
      managed_termination_protection = string # (Optional) Enables or disables container-aware termination of instances in the auto scaling group when scale-in happens. Valid values are ENABLED and DISABLED.
      managed_scaling                = object  ({ # (Optional) Configuration block defining the parameters of the auto scaling. Detailed below.
        maximum_scaling_step_size      = number # (Optional) Maximum step adjustment size. A number between 1 and 10,000.
        minimum_scaling_step_size      = number # (Optional) Minimum step adjustment size. A number between 1 and 10,000.
        status                         = string # (Optional) Whether auto scaling is managed by ECS. Valid values are ENABLED and DISABLED.
        instance_warmup_period          = number # (Optional) Period of time, in seconds, after a newly launched Amazon EC2 instance can contribute to CloudWatch metrics for Auto Scaling group. If this parameter is omitted, the default value of 300 seconds is used.
        target_capacity                 = number # (Optional) Target utilization for the capacity provider. A number between 1 and 100.
      

})
})


}

