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

variable "catalog_id" {
  type        = string
  description = "(Optional) The ID of the Data Catalog in which to create the connection. If none is supplied, the AWS account ID is used by default."
  default     = null
}

variable "connection_properties" {
  type        = map(string)
  description = "(Optional) A map of key-value pairs used as parameters for this connection."
  default     = {}
}

variable "connection_type" {
  type        = string
  description = "(Optional) The type of the connection. Supported are: JDBC, MONGODB, KAFKA, and NETWORK. Defaults to JBDC."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) Description of the connection."
  default     = null
}

variable "match_criteria" {
  type        = list(string)
  description = "(Optional) A list of criteria that can be used in selecting this connection."
  default     = null
}

variable "name" {
  type        = string
  description = "(Required) The name of the connection."
}

variable "physical_connection_requirements" {
  type = object({
    availability_zone      = string       #(Optional) The availability zone of the connection. This field is redundant and implied by subnet_id, but is currently an api requirement.
    security_group_id_list = list(string) #(Optional) The security group ID list used by the connection.
    subnet_id              = string       #(Optional) The subnet ID used by the connection.
  })
  description = "(Optional) A map of physical connection requirements, such as VPC and SecurityGroup. Defined below."
  default     = null
}