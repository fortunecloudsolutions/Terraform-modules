variable "volume_id" {
  description = "ID of the volume to attach to"
  type        = string
}
variable "device_name" {
  description = "The device name to expose to the instance (for example, /dev/sdh or xvdh). "
  type        = string
}
variable "instance_id" {
  description = "ID of the Instance to attach to"
  type        = string
}
variable "force_detach" {
  description = "Set to true if you want to force the volume to detach. "
  type        = bool
  default     = false
}
variable "skip_destroy" {
  description = " Set this to true if you do not wish to detach the volume from the instance to which it is attached at destroy time, and instead just remove the attachment from Terraform state."
  type        = bool
}