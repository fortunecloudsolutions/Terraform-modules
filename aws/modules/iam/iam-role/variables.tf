variable "name" {
  description = "The name of the role. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}
variable "role_policy" {
  description = "(Required) The policy that grants an entity permission to assume the role."
  type        = string
}
variable "force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  type        = bool
  default     = false
}
variable "path" {
  description = "The path to the role. "
  type        = string
  default     = null
}
variable "max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role."
  type        = number
  default     = null
}
variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}
variable "tags" {
  description = "Key-value map of tags for the IAM role"
  type        = map(any)
}


