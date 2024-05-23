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
variable "cluster_arn" {
  type        = string
  description = "(Required, Forces new resource) Amazon Resource Name (ARN) of the MSK cluster."
}
variable "secret_arn_list" {
  type        = list(string)
  description = " (Required) List of AWS Secrets Manager secret ARNs."
}
