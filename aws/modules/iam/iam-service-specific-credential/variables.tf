
variable "service_name" {
  description = "(Required) The name of the AWS service that is to be associated with the credentials. The service you specify here is the only service that can be accessed using these credentials."
  type        = string

}

variable "user_name" {
  description = "(Required) The name of the IAM user that is to be associated with the credentials."
  type        = string

}

variable "status" {
  description = "(Optional) The status to be assigned to the service-specific credential."
  type        = string
  default     = null

}

