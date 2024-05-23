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
#services

variable "environment" {
  description = "Name of environment"
  type        = string

}
variable "protocol" {
  description = "Name of protocol"
  type        = string
}
variable "family" {
  description = "Service family name"
  type        = string
}
variable "file_name" {
  description = "Service task definition"
  type        = string
  #default = "task-definitions/linux-http.json"
  #default = "task-definitions/iis.json"
}
variable "service_name" {
  description = "The name of the service"
  type        = string
}
variable "number_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = number
}
variable "container_name" {
  description = "The name of the container to associate with the load balancer (as it appears in a container definition)."
  type        = string
}
variable "container_port" {
  description = "The port on the container to associate with the load balancer."
  type        = list(any)
}

variable "cluster_id" {
  description = " ARN of an ECS cluster"
  type        = string
}

variable "component" {
  description = "Name of component"
  type        = string
}
variable "deployment_identifier" {
  description = "Name of deployment"
  type        = string
}
variable "cluster_name" {
  description = "Name of cluster"
  type        = string
}
variable "target_arn" {
  description = "target arn of alb"
  type        = string

}
variable "platform_version" {
  description = "The platform version on which to run your service. Only applicable for launch_type set to FARGATE."
  type        = string
}
