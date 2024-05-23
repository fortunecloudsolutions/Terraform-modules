variable "virtual_mfa_device_name" {
  description = "(Required) The name of the virtual MFA device. Use with path to uniquely identify a virtual MFA device."
  type        = string

}
variable "path" {
  description = "(Optional) The path for the virtual MFA device."
  type        = string
  default  =  null

}



