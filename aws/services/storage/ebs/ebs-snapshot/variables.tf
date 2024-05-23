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
variable "volume_id" {
  description = "The list of Volume IDs of which to make a snapshot."
  type        = string
}
variable "description" {
  description = "A list of descriptions of what the snapshot is."
  type        = string
}
variable "tags" {
  description = "A list of map of tags to assign for each snapshot"
  type        = map(string)
  default     = {}
}