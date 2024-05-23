variable "name" {
  type        = string
  description = "(Optional) Specifies the friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@- Conflicts with name_prefix"
  default     = null
}
variable "kms_key_id" {
  type        = string
  description = "(Optional) Specifies the ARN or Id of the AWS KMS customer master key (CMK) to be used to encrypt the secret values in the versions stored in this secret. If you don't specify this value, then Secrets Manager defaults to using the AWS account's default CMK (the one named aws/secretsmanager). If the default KMS CMK with that name doesn't yet exist, then AWS Secrets Manager creates it for you automatically the first time."
  default     = null
}
variable "name_prefix" {
  type        = string
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name."
  default     = null
}
variable "description" {
  type        = string
  description = " (Optional) A description of the secret."
  default     = null
}
variable "policy" {
  type        = string
  description = "(Optional) A valid JSON document representing a resource policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  default     = null
}
variable "recovery_window_in_days" {
  type        = number
  description = " (Optional) Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. The default value is 30"
  default     = null
}
variable "rotation_lambda_arn" {
  type        = string
  description = "(Optional, DEPRECATED) Specifies the ARN of the Lambda function that can rotate the secret. Use the aws_secretsmanager_secret_rotation resource to manage this configuration instead. As of version 2.67.0, removal of this configuration will no longer remove rotation due to supporting the new resource. Either import the new resource and remove the configuration or manually remove rotation."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Specifies a key-value map of user-defined tags that are attached to the secret."
  default     = {}
}

variable "rotation_rules" {
  type = object({
    automatically_after_days = number # (Required) Specifies the number of days between automatic scheduled rotations of the secret
  })
  description = "(Optional, DEPRECATED) A structure that defines the rotation configuration for this secret. Defined below. Use the aws_secretsmanager_secret_rotation resource to manage this configuration instead. As of version 2.67.0, removal of this configuration will no longer remove rotation due to supporting the new resource. Either import the new resource and remove the configuration or manually remove rotation."
  default     = null
}