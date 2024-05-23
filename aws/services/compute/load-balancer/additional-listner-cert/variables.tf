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

variable "listener_arn" {
  description = "The ARNS of the listener to which to attach the certification"
  type        = list(any)
}

variable "number_of_certs_added" {
  description = "The total number of certs added for all listeners"
  type        = number
}

variable "certificate_arn" {
  description = "The certificate arns that are added to the respective listeners listed in the variable 'listener_arn'"
  type        = list(any)
}
