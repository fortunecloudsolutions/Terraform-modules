
variable "target_group_arn" {
  description = "The ARN of the target group with which to register targets"
  type        = string
}

variable "instance_ip_ecscontainer_lambda_arn" {
  description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the arn of lambda."
  type        = list(string)
}

variable "target_port" {
  description = "The port on which targets receive traffic."
  type        = number
}

variable "az_ip_address" {
  description = "The Availability Zone where the IP address of the target is to be registered. If the private ip address is outside of the VPC scope, this value must be set to 'all'."
  type        = string
}

variable "number_of_targets" {
  description = "The number of instances/lambda arns/IP addresses to attach to the target"
  type        = number
}

variable "target_type" {
  description = "The types of the target attached to the target group, allowed values are 'instance','ipaddress','lambdaarn'"
  type        = string

  validation {
    condition     = contains(["instance", "ipaddress", "lambdaarn"], var.target_type)
    error_message = "The variable target_type needs to be one of 'instance','ipaddress' or 'lambdaarn'."
  }
}
