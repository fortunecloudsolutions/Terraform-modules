variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  description = "The Vault URL to which vault sends and requests data"
  type        = string
}
variable "vault_token" {
  description = "The vault token, used for authorization"
  type        = string
}

variable "max_lease_seconds" {
  description = "Specifies the maximum time-to-live. If set, this overrides the global default. Must be a valid duration string"
  type        = string
}

variable "backend" {
  description = "Backend is the provider"
  type        = string
}
variable "role" {
  description = "Role is usually resources"
  type        = string
}


variable "domain_name" {
  description = "(Required) A domain name for which the certificate should be issued"
  type        = string

}

variable "subject_alternative_names" {
  description = "(Optional) Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation."
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "(Required) Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  type        = string
}

variable "options" {
  description = "(Optional) Configuration block used to set certificate options. Detailed below."
  type = object({
    certificate_transparency_logging_preference = string # (Optional) Specifies whether certificate details should be added to a certificate transparency log. Valid values are ENABLED or DISABLED
  })
  default = null
}

variable "private_key" {
  description = "(Required) The certificate's PEM-formatted private key"
  type        = string
  default     = null
}

variable "certificate_body" {
  description = "(Required) The certificate's PEM-formatted public key"
  type        = string
  default     = null

}

variable "certificate_chain" {
  description = "(Optional) The certificate's PEM-formatted chain"
  type        = string
  default     = null

}

variable "certificate_authority_arn" {
  description = "(Required) ARN of an ACM PCA"
  type        = string
  default     = null

}

variable "tags" {
  description = "A map of tags to assign to the resource vpc."
  type        = map(any)
  default     = {}
}

