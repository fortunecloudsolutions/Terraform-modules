variable "vault_addr" {
  description = "vault address"
  type        = string
}

variable "vault_token" {
  description = "vault token"
  type        = string
}

variable "region" {
  description = "aws region"
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

variable "alb_name" {
  description = "The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with"
  type        = string
}

variable "alb_internal" {
  description = " If true, the LB will be internal."
  type        = bool
}

variable "security_group_ids" {
  description = "A list of security group IDs to assign to the LB. Only valid for Load Balancers of type"
  type        = list(string)
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. Default: 60."
  type        = number
  default     = 60
}

variable "enable_alb_delete_via_awsapi" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer."
  type        = bool
  default     = false
}

variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack"
  type        = string
  default     = "ipv4"
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(any)
  default     = {}
}

variable "access_log_bucket_name" {
  description = "The S3 bucket name to store the logs in"
  type        = string
}

variable "enable_access_logs" {
  description = "Boolean to enable / disable access_logs"
  type        = bool
  default     = false
}

variable "attach_alb_subnet_ids" {
  description = "The id of the subnet of which to attach to the load balancer. You can specify only one subnet per Availability Zone."
  type        = list(string)
}

variable "eip_alloc_ids" {
  description = "The allocation ID of the Elastic IP address"
  type        = list(string)
}

variable "private_ip4_for_internal_alb" {
  description = "The private ipv4 address within the subnet to assign to the internal-facing load balancer"
  type        = list(string)
}
