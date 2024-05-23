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

variable "name" {
  type        = string
  description = "(Required) The name of the function."
}

variable "catalog_id" {
  type        = string
  description = "(Optional) ID of the Glue Catalog to create the function in. If omitted, this defaults to the AWS Account ID."
  default     = null
}

variable "database_name" {
  type        = string
  description = "(Required) The name of the Database to create the Function."
}

variable "class_name" {
  type        = string
  description = "(Required) The Java class that contains the function code."
}

variable "owner_name" {
  type        = string
  description = "(Required) The owner of the function."
}

variable "owner_type" {
  type        = string
  description = "(Required) The owner type. can be one of USER, ROLE, and GROUP."
}

variable "resource_uris" {
  description = "(Optional) The configuration block for Resource URIs. See resource uris below for more details."
  type = list(object({
    resource_type = string #Required) The type of the resource. can be one of JAR, FILE, and ARCHIVE.
    uri           = string #(Required) The URI for accessing the resource.
  }))
  default = null
}

