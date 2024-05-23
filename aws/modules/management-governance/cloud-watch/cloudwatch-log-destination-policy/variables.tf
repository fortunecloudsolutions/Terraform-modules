variable "destination_name" {
  type        = string
  description = "(Required) A name for the subscription filter"
}

variable "access_policy" {
  type        = string
  description = "(Required) The policy document. This is a JSON formatted string."
}
