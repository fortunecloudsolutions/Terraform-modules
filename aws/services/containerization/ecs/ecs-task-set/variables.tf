variable "region" {
  description = "aws region"
  type        = string
}
variable "vault_addr" {
  description = "vault address"
  type        = string
}
variable "vault_token" {
  description = "vault token"
  type        = string
}
variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}
variable "backend" {
  description = "The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}
variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}
variable "service" {
  description = "(Required) The short name or ARN of the ECS service.  "
  type        = string 
}
variable "cluster" {
  description = "  (Required) The short name or ARN of the cluster that hosts the service to create the task set in. "
  type        = string 
}
variable "task_definition" {
  description = "(Required) The family and revision (family:revision) or full ARN of the task definition that you want to run in your service.  "
  type        = string 
  default     = null
}
variable "capacity_provider_strategy" {
  description = "(Optional) The capacity provider strategy to use for the service. Can be one or more. Defined below."
  type    = object({
    capacity_provider = string  # (Required) The short name of the capacity provider.
    weight            = number  # (Optional) The relative percentage of the total number of launched tasks that should use the specified capacity provider.
    base              = number  # (Optional) The number of tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined.
  })
  default = null
}
variable "external_id" {
  description = " (Optional) The external ID associated with the task set. "
  type        = string 
  default     = null
}
variable "force_delete" {
  description = "(Optional) Whether to allow deleting the task set without waiting for scaling down to 0. You can force a task set to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the tasks before deleting the task set. This bypasses that behavior and potentially leaves resources dangling.  "
  type        = string 
  default     = null
}
variable "launch_type" {
  description = " (Optional) The launch type on which to run your service. The valid values are EC2, FARGATE, and EXTERNAL. Defaults to EC2. "
  type        = string 
  default     = null
}
variable "load_balancer" {
  description = "   (Optional) Details on load balancers that are used with a task set. Detailed below."
  type        = object({
    load_balancer_name = string  #  (Optional, Required for ELB Classic) The name of the ELB (Classic) to associate with the service.
    target_group_arn  = string  #   (Optional, Required for ALB/NLB) The ARN of the Load Balancer target group to associate with the service.
    container_name    = string  # (Required) Name of the container to associate with the load balancer (as it appears in a container definition).
    container_port    = number  #  (Required) Port on the container to associate with the load balancer.
  })
  default = null
}
variable "platform_version" {
  description = "  (Optional) The platform version on which to run your service. Only applicable for launch_type set to FARGATE. Defaults to LATEST. More information about Fargate platform versions can be found in the AWS ECS User Guide. "
  type        = string 
  default     = null
}
variable "network_configuration" {
  description = "   (Optional) The network configuration for the service. This parameter is required for task definitions that use the awsvpc network mode to receive their own Elastic Network Interface, and it is not supported for other network modes. Detailed below."
  type        = object({
    subnets           = list(string)  #  (Required) The subnets associated with the task or service. Maximum of 16.
    security_groups   = list(string)  #  (Optional) The security groups associated with the task or service. If you do not specify a security group, the default security group for the VPC is used. Maximum of 5.
    assign_public_ip  = bool          #  (Optional) Whether to assign a public IP address to the ENI (FARGATE launch type only). Valid values are true or false. Default false.
  })
  default = null
}
variable "scale" {
  description = "(Optional) A floating-point percentage of the desired number of tasks to place and keep running in the task set. Detailed below."
  type = object({
    unit    = string  # (Optional) The unit of measure for the scale value. Default: PERCENT.
    value   = number  #  (Optional) The value, specified as a percent total of a service's desiredCount, to scale the task set. Defaults to 0 if not specified. Accepted values are numbers between 0.0 and 100.0.
  })
  default = null
}
variable "service_registries" {
  description = " (Optional) The service discovery registries for the service. The maximum number of service_registries blocks is 1. Detailed below."
  type        = object({
    registry_arn      = string   #  (Required) The ARN of the Service Registry. The currently supported service registry is Amazon Route 53 Auto Naming Service(aws_service_discovery_service resource). For more information, see Service.
    port              = number # (Optional) The port value used if your Service Discovery service specified an SRV record.
    container_port    = number #   (Optional) The port value, already specified in the task definition, to be used for your service discovery service.
    container_name    = string  # (Optional) Container name value, already specified in the task definition, to be used for your service discovery service.
  })
  default = null
}

variable "tags" {
  description = " (Optional) A map of tags to assign to the file system. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. If you have set copy_tags_to_backups to true, and you specify one or more tags, no existing file system tags are copied from the file system to the backup."
  type        = map(string)
  default     = null
}
variable "wait_until_stable" {
  description = "(Optional) Whether terraform should wait until the task set has reached STEADY_STATE  "
  type        = string 
  default     = null
}
variable "wait_until_stable_timeout" {
  description = " (Optional) Wait timeout for task set to reach STEADY_STATE. Valid time units include ns, us (or µs), ms, s, m, and h. Default 10m. "
  type        = string 
  default     = null
}