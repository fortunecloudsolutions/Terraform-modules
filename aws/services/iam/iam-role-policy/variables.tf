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





variable "iam_policy" {
  description = "(Required) The inline policy document. This is a JSON formatted string."
  type        = string
}
variable "iam_role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}
