variable "resource_arn" {
  type        = string
  description = "(Required) Amazon Resource Name (ARN) of the DynamoDB resource to tag."
}

variable "key" {
  type        = string
  description = "(Required) Tag name."
}

variable "value" {
  type        = string
  description = "(Required) Tag value."
}