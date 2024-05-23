variable "kafka_versions" {
  type        = list(string)
  description = "(Required) List of Apache Kafka versions which can use this configuration."
}

variable "name" {
  type        = string
  description = "(Required) Name of the configuration."
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