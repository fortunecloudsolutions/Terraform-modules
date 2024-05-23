


variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}


variable "iam_role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}

variable "iam_policy" {
  description = "(Required) The inline policy document. This is a JSON formatted string."
  type        = string
}

