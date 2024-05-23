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
variable "capacity_providers" {
  description = "(Optional, Deprecated use the aws_ecs_cluster_capacity_providers resource instead) List of short names of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE_SPOT"
  type        = list(string) 
  default     = null
}
variable "configuration" {
  description = "(Optional) The execute command configuration for the cluster. Detailed below."
  type        = object({  
    execute_command_configuration       = object({ #  (Optional) The details of the execute command configuration. Detailed below.
      kms_key_id                        = string #  (Optional) The AWS Key Management Service key ID to encrypt the data between the local client and the container.
      log_configuration                 = object({  #  (Optional) The log configuration for the results of the execute command actions Required when logging is OVERRIDE. Detailed below.
        cloud_watch_encryption_enabled  =  bool # (Optional) Whether or not to enable encryption on the CloudWatch logs. If not specified, encryption will be disabled. 
        cloud_watch_log_group_name      = string  # (Optional) The name of the CloudWatch log group to send logs to.
        s3_bucket_name                  = string # (Optional) The name of the S3 bucket to send logs to.
        s3_bucket_encryption_enabled    = bool  # (Optional) Whether or not to enable encryption on the logs sent to S3. If not specified, encryption will be disabled.
        s3_key_prefix                   = string # (Optional) An optional folder in the S3 bucket to place logs in.
      })
      logging                           = string # (Optional) The log setting to use for redirecting logs for your execute command results. Valid values are NONE, DEFAULT, and OVERRIDE.
    })  
  }) 
  default = null   
}
variable "default_capacity_provider_strategy" {
  description = "(Optional, Deprecated use the aws_ecs_cluster_capacity_providers resource instead) Configuration block for capacity provider strategy to use by default for the cluster. Can be one or more. Detailed below."
  type    = object({
    capacity_provider = string  # (Required) The short name of the capacity provider.
    weight            = number  # (Optional) The relative percentage of the total number of launched tasks that should use the specified capacity provider.
    base              = number  # (Optional) The number of tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined.
  })
  default = null
}
variable "name" {
  description = " (Required) Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
}
variable "setting" {
  description = "(Optional) Configuration block(s) with cluster settings. For example, this can be used to enable CloudWatch Container Insights for a cluster. Detailed below."
  type = object({
    name    = string  # (Required) Name of the setting to manage. Valid values: containerInsights
    value   = number  # (Required) The value to assign to the setting. Valid values are enabled and disabled
  })
  default = null
}
variable "tags" {
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = null
}
