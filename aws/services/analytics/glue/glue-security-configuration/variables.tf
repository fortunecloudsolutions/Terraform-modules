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

variable "name" {
  type        = string
  description = "(Required) Name of the security configuration."
}

variable "encryption_configuration" {
  type = object({
    cloudwatch_encryption = object({
      cloudwatch_encryption_mode = string #(Optional) Encryption mode to use for CloudWatch data. Valid values: DISABLED, SSE-KMS. Default value: DISABLED.
      kms_key_arn                = string #(Optional) Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.
    })

    job_bookmarks_encryption = object({
      job_bookmarks_encryption_mode = string #(Optional) Encryption mode to use for job bookmarks data. Valid values: CSE-KMS, DISABLED. Default value: DISABLED.
      kms_key_arn                   = string #(Optional) Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.
    })

    s3_encryption = object({
      s3_encryption_mode = string #(Optional) Encryption mode to use for S3 data. Valid values: DISABLED, SSE-KMS, SSE-S3. Default value: DISABLED.
      kms_key_arn        = string #(Optional) Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.
    })


  })
  description = "(Required) Configuration block containing encryption configuration."
}