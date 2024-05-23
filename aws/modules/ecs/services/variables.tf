variable "name" {
  description = "The name of the service (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string

}
variable "cluster" {
  description = "ARN of an ECS cluster"
  type        = string

}


variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = string

}

variable "container_port" {
  description = "The port on the container to associate with the load balancer."
  type        = list(any)

}
variable "task_definition" {
  description = " Full ARN of the Task Definition (including both family and revision)."
  type        = string
}


variable "environment" {
  description = "environment"
  type        = string

}
variable "protocol" {
  description = "protocol"
  type        = string

}
variable "container_name" {
  description = "The name of the container to associate with the load balancer (as it appears in a container definition)."
  type        = string


}
variable "target_arn" {
  description = "(Required for ALB/NLB) The ARN of the Load Balancer target group to associate with the service."

}
variable "deployment_maximum_percent" {
  description = "The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment."
  default     = null
}
variable "deployment_minimum_healthy_percent" {
  description = "The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  default     = null
}
variable "force_new_deployment" {
  description = "Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination"
  default     = null
}
variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown"
  default     = null
}
variable "launch_type" {
  description = "The launch type on which to run your service. The valid values are EC2 and FARGATE. "
  default     = "EC2"
}
variable "platform_version" {
  description = "The platform version on which to run your service. Only applicable for launch_type set to FARGATE."
  type        = string
  default     = "LATEST"

}
variable "scheduling_strategy" {
  description = "The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. "
  type        = string
  default     = "REPLICA"
}

/*variable "interval" {
  description = "interval"
  type = string

}*/

/*variable "proxy_configuration" {
  description = "The proxy configuration details for the App Mesh proxy."
  default = null

}
variable "inference_accelerator" {
  description = "Configuration block(s) with Inference Accelerators settings."
  default = null

}*/