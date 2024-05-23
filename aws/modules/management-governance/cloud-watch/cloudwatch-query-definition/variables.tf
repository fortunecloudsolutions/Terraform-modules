variable "name" {
  type        = string
  description = "(Required) The name of the query."
}

variable "query_string" {
  type        = string
  description = "(Required) The query to save. "
}

variable "log_group_names" {
  type        = list(string)
  description = "(Optional) Specific log groups to use with the query."
}


