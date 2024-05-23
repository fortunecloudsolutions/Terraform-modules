variable "name" {
  description = "The fully qualified name for the directory, such as corp.example.com"
  type        = string
}
variable "password" {
  description = "The password for the directory administrator or connector user."
  type        = string
}
variable "enable_sso" {
  description = "Whether to enable single-sign on for the directory. Requires alias. Defaults to false."
  type        = bool
  default     = false
}
variable "edition" {
  description = "The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise (applies to MicrosoftAD type only)."
  type        = string
  default     = "Enterprise"
}
variable "short_name" {
  description = "The short name of the directory, such as CORP."
  type        = string
}
variable "vpc_id" {
  description = "The identifier of the VPC that the directory is in."
  type        = string
}
variable "subnet_ids" {
  description = "The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs)."
  type        = list(string)
}
variable "dir_type" {
  description = "The directory type (SimpleAD, ADConnector or MicrosoftAD are accepted values). Defaults to SimpleAD."
  default     = "SimpleAD"
}
variable "size" {
  description = "(Required for SimpleAD and ADConnector) The size of the directory (Small or Large are accepted values)."
  type        = number
  default     = null
}

