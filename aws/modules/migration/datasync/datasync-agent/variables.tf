variable "name" {
  description = "(Required) Name of the DataSync Agent."
  type        = string
}

variable "activation_key" {
  description = "(Optional) DataSync Agent activation key during resource creation. Conflicts with ip_address. If an ip_address is provided instead, Terraform will retrieve the activation_key as part of the resource creation."
  type        = string
}

variable "ip_address" {
  description = "(Optional) DataSync Agent IP address to retrieve activation key during resource creation. Conflicts with activation_key. DataSync Agent must be accessible on port 80 from where Terraform is running."
  type        = string
}

variable "tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Agent."
  type        = map(string)
}

variable "timeouts" {
  description = "aws_datasync_agent provides the following Timeouts configuration options:"
  type = object({
    create = string # aws_datasync_agent provides the following Timeouts configuration options:
  })
}