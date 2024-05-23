/*variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)

}*/
variable "tags" {
  description = "(optional) Additional tags to be applied to all resources"
  default     = {}
}
variable "name" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string

}
variable "capacity_providers" {
  description = "List of short names of one or more capacity providers to associate with the cluster."
  default     = null
}
/*variable default_capacity_provider_strategy {
  description = "The capacity provider strategy to use by default for the cluster."
  type=map(string)
  default = {}
}
variable setting {
  description = "Configuration block(s) with cluster settings."
  type = map(string)
  default = {}
}*/