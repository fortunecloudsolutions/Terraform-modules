
variable "value" {
  description = "(Required) State of the setting. Valid values are enabled and disabled."
  type        = string
}
variable "name" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
}
