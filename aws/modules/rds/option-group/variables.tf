variable "name" {
  description = "The name of the option group. If omitted, Terraform will assign a random, unique name. Must be lowercase, to match as it is stored in AWS."
  type        = string
  default     = null
}
variable "option_group_description" {
  description = "The description of the option group"
  type        = string
  default     = "Managed by Terraform"
}
variable "engine_name" {
  description = "Specifies the name of the engine that this option group should be associated with."
  type        = string

}
variable "major_engine_version" {
  description = " Specifies the major version of the engine that this option group should be associated with."
  type        = string
}

variable "options" {
  description = "A list of Options to apply"
  type        = any
  default     = []
}

variable "timeouts" {
  description = "Define maximum timeout for deletion of `aws_db_option_group` resource"
  type        = map(string)
  default = {
    delete = "15m"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


