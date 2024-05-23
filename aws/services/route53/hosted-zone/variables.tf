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

variable "name" {
  type        = string
  description = " This is the name of the hosted zone."
}

variable "comment" {
  type        = string
  description = " A comment for the hosted zone. Defaults to 'Managed by Terraform'."
}

variable "force_destroy" {
  type        = string
  description = " Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
}

variable "tags" {
  description = "A map of tags to assign to the zone."
  type        = map(any)
  default     = {}
}

variable "vpc" {
  type = list(object({
    vpc_id     = string # ID of the VPC to associate.
    vpc_region = string # Region of the VPC to associate. Defaults to AWS provider region.
  }))
  description = "Configuration block(s) specifying VPC(s) to associate with a private hosted zone. "
  default     = null
}
