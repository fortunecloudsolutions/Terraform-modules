variable "table_name" {
  type        = string
  description = "(Required) The name of the table to contain the item."
}

variable "hash_key" {
  type        = string
  description = "(Required) Hash key to use for lookups and identification of the item"
}

variable "range_key" {
  type        = string
  description = "(Optional) Range key to use for lookups and identification of the item. Required if there is range key defined in the table."
  default     = null
}


variable "item" {
  type        = string
  description = "(Required) JSON representation of a map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item."
}