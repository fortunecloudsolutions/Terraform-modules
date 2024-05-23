variable "instance_id" {
  description = "(Required) Instance ID to attach."
  type        = string

}

variable "network_interface_id" {
  description = " (Required) ENI ID to attach."
  type        = string

}

variable "device_index" {
  description = "(Required) Network interface index (int)."
  type        = number
}
