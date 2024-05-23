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
variable "url" {
  description = " (Required) The URL of the identity provider. Corresponds to the iss claim. "
  type        = string


}

variable "client_id_list" {
  description = " (Required) A list of client IDs (also known as audiences)."
  type        = list(any)



}
variable "thumbprint_list" {
  description = "(Required) A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s)."
  type        = list(any)
}


