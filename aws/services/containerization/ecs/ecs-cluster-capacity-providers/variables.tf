variable "region" {
  description = "aws region"
  type        = string
}
variable "vault_addr" {
  description = "vault address"
  type        = string
}
variable "vault_token" {
  description = "vault token"
  type        = string
}
variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}
variable "backend" {
  description = "The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}
variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}




variable "cluster_name" {
  description = "(Required, Forces new resource) Name of the ECS cluster to manage capacity providers for."
  type        = string
}

variable "capacity_providers" {
  description = "(Optional) Set of names of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE_SPOT."
  type        = list(string)
  default     = null
}

variable "default_capacity_provider_strategy" {
  description = "(Optional) Set of capacity provider strategies to use by default for the cluster."
  type = object({
    weight            = number #  The relative percentage of the total number of launched tasks that should use the specified capacity provider. The weight value is taken into consideration after the base count of tasks has been satisfied. Defaults to 0.
    base              = number # (Optional) The number of tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined. Defaults to 0.
    capacity_provider = string # Set of capacity provider strategies to use by default for the cluster."

  })
  default = null

}



