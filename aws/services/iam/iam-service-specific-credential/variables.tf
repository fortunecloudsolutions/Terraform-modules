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

