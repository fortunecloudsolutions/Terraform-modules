
variable "resource_arn" {
  description = "(Required) Amazon Resource Name (ARN) of the ECS resource to tag."
    type        = string
}
variable "key" {
  description = "(Required) Tag name."
  type        = string
}

variable "value" {
  description = "(Required) Tag value."
  type        = string
}