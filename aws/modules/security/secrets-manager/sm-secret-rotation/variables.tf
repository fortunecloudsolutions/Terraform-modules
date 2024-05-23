variable "secret_id" {
  type        = string
  description = " (Required) Specifies the secret to which you want to add a new version. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret. The secret must already exist."
}

variable "rotation_lambda_arn" {
  type        = string
  description = " (Required) Specifies the ARN of the Lambda function that can rotate the secret."
}

variable "rotation_rules" {
  type = object({
    automatically_after_days = number #  (Required) Specifies the number of days between automatic scheduled rotations of the secret.
  })
  description = " (Required) A structure that defines the rotation configuration for this secret. Defined below."
}