
variable "target_group_name" {
  description = "The name of the target group. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "target_port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target."
  type        = number
}

variable "target_protocol" {

  description = "The protocol to use for routing traffic to the targets. Should be one of 'TCP', 'TLS', 'UDP', 'TCP_UDP', 'HTTP' or 'HTTPS'. Required when target_type is instance or ip. Does not apply when target_type is lambda."
  type        = string
}

variable "target_vpc_id" {
  description = "The identifier of the VPC in which to create the target group. Required when target_type is instance or ip. Does not apply when target_type is lambda."
  type        = string
}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds."
  type        = number
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address) or lambda (targets are specified by lambda arn)."
  type        = string
}

variable "tags" {
  description = "Map of tag key and value pairs"
  type        = map(any)
  default = {
    "Name" = "MatildaMigrationDemo"
  }

}

variable "health_check_enabled" {
  description = "Indicates whether health checks are enabled. Defaults to true."
  type        = bool
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. For lambda target groups, it needs to be greater as the timeout of the underlying lambda"
  type        = number
}

variable "health_check_port" {
  description = "The port to use to connect with the target. Valid values are either ports 1-65535, or traffic-port. Defaults to traffic-port."
  type        = number
}

variable "health_check_protocol" {
  description = "The protocol to use to connect with the target. Defaults to HTTP. Not applicable when target_type is lambda"
  type        = string

  validation {
    condition     = var.health_check_protocol != "HTTP" && var.health_check_protocol != "HTTPS"
    error_message = "The allowed protocol for network load balancer is TCP/TLS/UDP/TCP_UDP."
  }
}

variable "healthy_unhealthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 3."
  type        = number
}
