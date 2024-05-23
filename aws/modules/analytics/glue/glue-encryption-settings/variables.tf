variable "catalog_id" {
  type        = string
  description = "(Optional) The ID of the Data Catalog to set the security configuration for. If none is provided, the AWS account ID is used by default."
  default     = null
}

variable "data_catalog_encryption_settings" {
  type = object({
    connection_password_encryption = object({
      return_connection_password_encrypted = bool   #(Required) When set to true, passwords remain encrypted in the responses of GetConnection and GetConnections. This encryption takes effect independently of the catalog encryption.
      aws_kms_key_id                       = string #(Required) When set to true, passwords remain encrypted in the responses of GetConnection and GetConnections. This encryption takes effect independently of the catalog encryption.
    })
    encryption_at_rest = object({
      catalog_encryption_mode = string #(Required) The encryption-at-rest mode for encrypting Data Catalog data. Valid values are DISABLED and SSE-KMS.
      sse_aws_kms_key_id      = string #(Optional) The ARN of the AWS KMS key to use for encryption at rest.

    })

  })
  description = "(Required) The security configuration to set. see Data Catalog Encryption Settings."
}