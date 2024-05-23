
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
 