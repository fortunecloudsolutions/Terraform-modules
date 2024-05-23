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

variable "domain_name" {
  type        = string
  description = "(Required) Name of the domain."
}


variable "saml_options" {
  type = object({
    enabled                 = bool   # (Required) Whether SAML authentication is enabled.
    master_backend_role     = string #(Optional) This backend role from the SAML IdP receives full permissions to the cluster, equivalent to a new master user.
    master_user_name        = string #(Optional) This username from the SAML IdP receives full permissions to the cluster, equivalent to a new master user.
    roles_key               = string #(Optional) Element of the SAML assertion to use for backend roles. Default is roles.
    session_timeout_minutes = number #(Optional) Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440.
    subject_key             = string #(Optional) Element of the SAML assertion to use for username. Default is NameID.

    idp = object({
      entity_id        = string #Required) The unique Entity ID of the application in SAML Identity Provider.
      metadata_content = string # (Required) The Metadata of the SAML application in xml format.

    })
  })
  description = "(Optional) The SAML authentication options for an AWS Elasticsearch Domain."
  default     = null
}