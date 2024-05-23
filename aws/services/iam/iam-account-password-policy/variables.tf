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
variable "allow_users_to_change_password" {
  description = "(Optional) Whether to allow users to change their own password"
  type        = string

}

variable "require_symbols" {
  description = "(Optional) Whether to require symbols for user passwords."
  type        = bool


}
variable "require_uppercase_characters" {
  description = "(Optional) Whether to require uppercase characters for user passwords."
  type        = string

}
variable "require_numbers" {
  description = "(Optional) Whether to require numbers for user passwords.."
  type        = string

}
variable "require_lowercase_characters" {
  description = "(Optional) Whether to require lowercase characters for user passwords."
  type        = string

}
variable "minimum_password_length" {
  description = "(Optional) Minimum length to require for user passwords."
  type        = string

}
variable "max_password_age" {
  description = "(Optional) The number of days that an user password is valid."
  type        = number

}
variable "hard_expiry" {
  description = "Whether users are prevented from setting a new password after their password has expired (i.e., require administrator reset)"
  type        = string

}

