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

variable "certificate_arn" {
  description = "(Optional, Default: empty string) The Amazon Resource Name (ARN) for the certificate."
  type        = string
  default     = null
}

variable "database_name" {
  description = "(Optional) The name of the endpoint database."
  type        = string
  default     = null
}

variable "elasticsearch_settings" {
  description = "(Optional) Configuration block with Elasticsearch settings. Detailed below."
  type = object({
    endpoint_uri               = string # (Required) Endpoint for the Elasticsearch cluster.
    error_retry_duration       = number # (Optional) Maximum number of seconds for which DMS retries failed API requests to the Elasticsearch cluster. Defaults to 300.
    full_load_error_percentage = number # (Optional) Maximum percentage of records that can fail to be written before a full load operation stops. Defaults to 10.
    service_access_role_arn    = string # (Required) Amazon Resource Name (ARN) of the IAM Role with permissions to write to the Elasticsearch cluster.
  })
  default = null
}

variable "endpoint_id" {
  description = "(Required) The database endpoint identifier. Must contain from 1 to 255 alphanumeric characters or hyphens. Must begin with a letter. Must contain only ASCII letters, digits, and hyphens. Must not end with a hyphen and not contain two consecutive hyphens."
  type        = string
}

variable "engine_name" {
  description = "(Required) The type of engine for the endpoint. Can be one of aurora | aurora-postgresql| azuredb | db2 | docdb | dynamodb | elasticsearch | kafka | kinesis | mariadb | mongodb | mysql | oracle | postgres | redshift | s3 | sqlserver | sybase."
  type        = string
}

variable "extra_connection_attributes" {
  description = "(Optional) Additional attributes associated with the connection."
  type        = string
  default     = null
}

variable "kafka_settings" {
  description = "(Optional) Configuration block with Kafka settings. Detailed below."
  type = object({
    broker = string # (Required) Kafka broker location. Specify in the form broker-hostname-or-ip:port.
    topic  = string # (Optional) Kafka topic for migration. Defaults to kafka-default-topic
  })
  default = null
}

variable "kinesis_settings" {
  description = "(Optional) Configuration block with Kinesis settings. Detailed below."
  type = object({
    message_format          = string #  (Optional) Output format for the records created. Defaults to json. Valid values are json and json_unformatted (a single line with no tab).
    service_access_role_arn = string # (Optional) Amazon Resource Name (ARN) of the IAM Role with permissions to write to the Kinesis data stream.
    stream_arn              = string # (Optional) Amazon Resource Name (ARN) of the Kinesis data stream.
  })
  default = null
}

variable "kms_key_arn" {
  description = "(Required when engine_name is mongodb, optional otherwise) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region."
  type        = string
  default     = null
}

variable "mongodb_settings" {
  description = "(Optional) Configuration block with MongoDB settings. Detailed below."
  type = object({
    auth_mechanism      = string # (Optional) Authentication mechanism to access the MongoDB source endpoint. Defaults to default.
    auth_source         = string #  (Optional) Authentication database name. Not used when auth_type is no. Defaults to admin
    auth_type           = string # (Optional) Authentication type to access the MongoDB source endpoint. Defaults to password.
    docs_to_investigate = number # (Optional) Number of documents to preview to determine the document organization. Use this setting when nesting_level is set to one. Defaults to 1000.
    extract_doc_id      = string #  (Optional) Document ID. Use this setting when nesting_level is set to none. Defaults to false. 
    nesting_level       = string # (Optional) Specifies either document or table mode. Defaults to none. Valid values are one (table mode) and none (document mode).
  })
  default = null
}

variable "password" {
  description = "(Optional) The password to be used to login to the endpoint database."
  type        = string
  default     = null
}

variable "port" {
  description = "(Optional) The port used by the endpoint database."
  type        = string
  default     = null
}

variable "s3_settings" {
  description = "(Optional) Configuration block with S3 settings. Detailed below."
  type = object({
    bucket_folder             = string # (Optional) S3 Bucket Object prefix.
    bucket_name               = string # (Optional) S3 Bucket name.
    compression_type          = string # (Optional) Set to compress target files. Defaults to NONE. Valid values are GZIP and NONE.
    csv_delimiter             = string #  (Optional) Delimiter used to separate columns in the source files. Defaults to ,.
    csv_row_delimiter         = string # (Optional) Delimiter used to separate rows in the source files. Defaults to \n.
    external_table_definition = string # (Optional) JSON document that describes how AWS DMS should interpret the data.
    service_access_role_arn   = string # (Optional) Amazon Resource Name (ARN) of the IAM Role with permissions to read from or write to the S3 Bucket. 
  })
  default = null
}

variable "server_name" {
  description = "(Optional) The host name of the server."
  type        = string
  default     = null
}

variable "service_access_role" {
  description = "(Optional) The Amazon Resource Name (ARN) used by the service access IAM role for dynamodb endpoints."
  type        = string
  default     = null
}

variable "ssl_mode" {
  description = "(Optional, Default: none) The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full"
  type        = string
  default     = "none"
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "username" {
  description = "(Optional) The user name to be used to login to the endpoint database."
  type        = string
  default     = null
}