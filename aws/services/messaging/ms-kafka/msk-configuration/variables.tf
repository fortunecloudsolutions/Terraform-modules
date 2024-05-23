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
variable "kafka_versions" {
  type        = list(string)
  description = "(Required) List of Apache Kafka versions which can use this configuration."
}
variable "name" {
  type        = string
  description = " (Required) Name of the configuration."
}
variable "server_properties" {
  type        = string
  description = "(Required) Contents of the server.properties file. Supported properties are documented in the MSK Developer Guide."
}
variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the configuration."
}