variable "path" {
  description = "(Required) The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}

variable "name" {
  description = " The name to identify this role within the backend. Must be unique within the backend."
  type        = string
}
variable "credential_type" {
  description = "Specifies the type of credential to be used when retrieving credentials from the role. Must be one of iam_user, assumed_role, or federation_token."
  type        = string
}
variable "role_arns" {
  description = "Specifies the ARNs of the AWS roles this Vault role is allowed to assume. Required when credential_type is assumed_role and prohibited otherwise.Specifies the ARNs of the AWS roles this Vault role is allowed to assume. Required when credential_type is assumed_role and prohibited otherwise.Specifies the ARNs of the AWS roles this Vault role is allowed to assume. Required when credential_type is assumed_role and prohibited otherwise."
  default     = null
}
variable "policy_arns" {
  description = "Specifies a list of AWS managed policy ARNs. The behavior depends on the credential type. "
  default     = null
}
variable "iam_groups" {
  description = " A list of IAM group names. IAM users generated against this vault role will be added to these IAM Groups. "
  default     = null
}
variable "default_sts_ttl" {
  description = "The default TTL in seconds for STS credentials. When a TTL is not specified when STS credentials are requested, and a default TTL is specified on the role, then this default TTL will be used. "
  default     = null
}
variable "max_sts_ttl" {
  description = "The max allowed TTL in seconds for STS credentials (credentials TTL are capped to max_sts_ttl)."
  default     = null
}