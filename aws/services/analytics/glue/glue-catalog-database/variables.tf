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
  description = "(Optional) ID of the Glue Catalog to create the database in. If omitted, this defaults to the AWS Account ID."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) Description of the database."
  default     = null
}

variable "location_uri" {
  type        = string
  description = "(Optional) Location of the database (for example, an HDFS path)."
  default     = null
}

variable "name" {
  type        = string
  description = "(Required) Name of the database. The acceptable characters are lowercase letters, numbers, and the underscore character."
  default     = null
}

variable "parameters" {
  type        = map(string)
  description = "(Optional) List of key-value pairs that define parameters and properties of the database."
  default     = {}
}

variable "target_database" {
  description = "(Optional) Configuration block for a target database for resource linking. See target_database below."

  type = object({
    catalog_id    = string #(Required) ID of the Data Catalog in which the database resides.
    database_name = string #(Required) Name of the catalog database.
  })

  default = null
}
