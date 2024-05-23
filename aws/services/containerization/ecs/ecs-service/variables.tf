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
variable "name" {
  description = "(Required) Name of the service (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
}
variable "capacity_provider_strategy" {
  description = "  (Optional) Capacity provider strategies to use for the service. Can be one or more. These can be updated without destroying and recreating the service only if force_new_deployment = true and not changing from 0 capacity_provider_strategy blocks to greater than 0, or vice versa. See below."
  type        = object({
    base                = number  #  (Optional) Number of tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined.
    capacity_provider   = string  # (Required) Short name of the capacity provider.
    weight              = number  # (Required) Relative percentage of the total number of launched tasks that should use the specified capacity provider.
  })
  default = null
}
variable "cluster" {
  description = " (Optional) ARN of an ECS cluster."
  type        = string
  default     = null
}
variable "deployment_circuit_breaker" {
  description = " (Optional) Configuration block for deployment circuit breaker. See below.  "
  type        = object({
    enable        =  bool #  (Required) Whether to enable the deployment circuit breaker logic for the service.
    rollback      = bool # (Required) Whether to enable Amazon ECS to roll back the service if a service deployment fails. If rollback is enabled, when a service deployment fails, the service is rolled back to the last deployment that completed successfully.
  })
  default = null
}
variable "deployment_controller" {
  description = " (Optional) Configuration block for deployment controller configuration. See below.  "
  type        = object({
    type      =  string # (Optional) Type of deployment controller. Valid values: CODE_DEPLOY, ECS, EXTERNAL. Default: ECS.
  })
  default = null
}
variable "deployment_maximum_percent" {
  description = " (Optional) Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. Not valid when using the DAEMON scheduling strategy.  "
  type        = string
  default     = null
}
variable "deployment_minimum_healthy_percent" {
  description = "  (Optional) Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  type        = number
  default     = null
}
variable "desired_count" {
  description = "  (Optional) Number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy. "
  type        = number
  default     = null
}
variable "enable_ecs_managed_tags" {
  description = "  (Optional) Specifies whether to enable Amazon ECS managed tags for the tasks within the service. "
  type        = bool
  default     = null
}
variable "enable_execute_command" {
  description = " (Optional) Specifies whether to enable Amazon ECS Exec for the tasks within the service. "
  type        = bool
  default     = null
}
variable "force_new_deployment" {
  description = "  (Optional) Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination (e.g., myimage:latest), roll Fargate tasks onto a newer platform version, or immediately deploy ordered_placement_strategy and placement_constraints updates. "
  type        = bool
  default     = null
}
variable "health_check_grace_period_seconds" {
  description = " (Optional) Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers. "
  type        = number
  default     = null
}
variable "iam_role" {
  description = " (Optional) ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here. "
  type        = string
  default     = null
}
variable "launch_type" {
  description = "  (Optional) Launch type on which to run your service. The valid values are EC2, FARGATE, and EXTERNAL. Defaults to EC2. "
  type        = string
  default     = null
}
variable "load_balancer" {
  description = "   (Optional) Configuration block for load balancers. See below. "
  type        = object({
    elb_name          = string  #  (Required for ELB Classic) Name of the ELB (Classic) to associate with the service.
    target_group_arn  = string  #  (Required for ALB/NLB) ARN of the Load Balancer target group to associate with the service.
    container_name    = string  # (Required) Name of the container to associate with the load balancer (as it appears in a container definition).
    container_port    = number  #  (Required) Port on the container to associate with the load balancer.
  })
  default = null
}
variable "network_configuration" {
  description = "  (Optional) Network configuration for the service. This parameter is required for task definitions that use the awsvpc network mode to receive their own Elastic Network Interface, and it is not supported for other network modes. See below.  "
  type        = object({
    subnets           = list(string)  #  (Required) Subnets associated with the task or service.
    security_groups   = list(string)  #  (Optional) Security groups associated with the task or service. If you do not specify a security group, the default security group for the VPC is used.
    assign_public_ip  = bool          #  (Optional) Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false. Default false.
  })
  default = null
}
variable "ordered_placement_strategy" {
  description = "  (Optional) Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. The maximum number of ordered_placement_strategy blocks is 5. See below.  "
  type        = object({
    type      = string # (Required) Type of placement strategy. Must be one of: binpack, random, or spread
    field     = string  # (Optional) For the spread placement strategy, valid values are instanceId (or host, which has the same effect), or any platform or custom attribute that is applied to a container instance. For the binpack type, valid values are memory and cpu. For the random type, this attribute is not needed. For more information, see Placement Strategy.
  })
  default = null
}
variable "placement_constraints" {
  description = " (Optional) Rules that are taken into consideration during task placement. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. Maximum number of placement_constraints is 10. See below.  "
  type        = object({
    type          = string  # (Required) Type of constraint. The only valid values at this time are memberOf and distinctInstance.
    expression    = string  #  (Optional) Cluster Query Language expression to apply to the constraint. Does not need to be specified for the distinctInstance type. For more information, see Cluster Query Language in the Amazon EC2 Container Service Developer Guide.
  })
  default = null
}
variable "platform_version" {
  description = " (Optional) Platform version on which to run your service. Only applicable for launch_type set to FARGATE. Defaults to LATEST. More information about Fargate platform versions can be found in the AWS ECS User Guide. "
  type        = string
  default     = null
}
variable "propagate_tags" {
  description = " (Optional) Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION. "
  type        = string
  default     = null
}
variable "scheduling_strategy" {
  description = "  (Optional) Scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy. "
  type        = string
  default     = null
}
variable "service_registries" {
  description = "  (Optional) Service discovery registries for the service. The maximum number of service_registries blocks is 1. See below.  "
  type        = object({
    registry_arn      = string   # (Required) ARN of the Service Registry. The currently supported service registry is Amazon Route 53 Auto Naming Service(aws_service_discovery_service). For more information, see Service
    port              = number # (Optional) Port value used if your Service Discovery service specified an SRV record.
    container_port    = number #  (Optional) Port value, already specified in the task definition, to be used for your service discovery service.
    container_name    = string  # (Optional) Container name value, already specified in the task definition, to be used for your service discovery service.
  })
  default = null
}
variable "tags" {
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = null
}
variable "task_definition" {
  description = "  (Optional) Family and revision (family:revision) or full ARN of the task definition that you want to run in your service. Required unless using the EXTERNAL deployment controller. If a revision is not specified, the latest ACTIVE revision is used. "
  type        = string
  default     = null
}
variable "wait_for_steady_state" {
  description = " (Optional) If true, Terraform will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing. Default false. "
  type        = bool
  default     = null
}