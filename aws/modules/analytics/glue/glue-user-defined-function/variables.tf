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

