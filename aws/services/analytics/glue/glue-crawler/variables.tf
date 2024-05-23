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

variable "database_name" {
  type        = string
  description = "(Required) Glue database where results are written."
}

variable "name" {
  type        = string
  description = "(Required) Name of the crawler."
}

variable "iam_role" {
  type        = string
  description = "(Required) The IAM role friendly name (including path without leading slash), or ARN of an IAM role, used by the crawler to access other resources."
}

variable "classifiers" {
  type        = list(string)
  description = "(Optional) List of custom classifiers. By default, all AWS classifiers are included in a crawl, but these custom classifiers always override the default classifiers for a given classification."
  default     =  []
}

variable "configuration" {
  type        = string
  description = "(Optional) JSON string of configuration information. For more details see Setting Crawler Configuration Options."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) Description of the crawler."
  default     = null
}

variable "schedule" {
  type        = string
  description = "(Optional) A cron expression used to specify the schedule. For more information, see Time-Based Schedules for Jobs and Crawlers. "
  default     = null
}

variable "security_configuration" {
  type        = string
  description = "(Optional) The name of Security Configuration to be used by the crawler"
  default     = null
}

variable "table_prefix" {
  type        = string
  description = "(Optional) The table prefix used for catalog tables that are created."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}

variable "dynamodb_target" {
  description = "(Optional) List of nested DynamoDB target arguments. See Dynamodb Target below."
  type = list(object({
    path      = string #(Required) The name of the DynamoDB table to crawl.
    scan_all  = bool   #(Optional) Indicates whether to scan all the records, or to sample rows from the table. Scanning all the records can take a long time when the table is not a high throughput table. defaults to true.
    scan_rate = number #(Optional) The percentage of the configured read capacity units to use by the AWS Glue crawler. The valid values are null or a value between 0.1 to 1.5.
  }))
  default = null
}


variable "jdbc_target" {
  description = "(Optional) List of nested JBDC target arguments. See JDBC Target below."
  type = list(object({
    connection_name = string       #(Required) The name of the connection to use to connect to the JDBC target.
    path            = string       #(Required) The path of the JDBC target.
    exclusions      = list(string) #(Optional) A list of glob patterns used to exclude from the crawl.
  }))
  default = null
}

variable "s3_target" {
  description = "(Optional) List nested Amazon S3 target arguments. See S3 Target below."
  type = list(object({
    connection_name = string       #(Optional) The name of a connection which allows crawler to access data in S3 within a VPC.
    path            = string       #(Required) The path to the Amazon S3 target.
    exclusions      = list(string) #(Optional) A list of glob patterns used to exclude from the crawl.
  }))
  default = null
}

variable "catalog_target" {
  description = "(Optional) List nested catalog_target arguments."
  type = list(object({
    database_name = string       #(Required) The name of the Glue database to be synchronized.
    tables        = list(string) # (Required) A list of catalog tables to be synchronized.
  }))
  default = null
}

variable "mongodb_target" {
  description = "(Optional) List nested MongoDB target arguments. See MongoDB Target below."
  type = list(object({
    connection_name = string #(Required) The name of the connection to use to connect to the Amazon DocumentDB or MongoDB target.
    path            = string #(Required) The path of the Amazon DocumentDB or MongoDB target (database/collection).
    scan_all        = bool   #(Optional) Indicates whether to scan all the records, or to sample rows from the table. Scanning all the records can take a long time when the table is not a high throughput table. Default value is true.
  }))
  default = null
}

variable "schema_change_policy" {
  description = "(Optional) Policy for the crawler's update and deletion behavior. See Schema Change Policy below."
  type = object({
    delete_behavior = string #(Required) (Optional) The deletion behavior when the crawler finds a deleted object. Valid values: LOG, DELETE_FROM_DATABASE, or DEPRECATE_IN_DATABASE. Defaults to DEPRECATE_IN_DATABASE.
    update_behavior = string # (Optional) The update behavior when the crawler finds a changed schema. Valid values: LOG or UPDATE_IN_DATABASE. Defaults to UPDATE_IN_DATABASE.
  })
  default = null
}

variable "lineage_configuration" {
  description = "(Optional) Specifies data lineage configuration settings for the crawler. See Lineage Configuration below."
  type = object({
    crawler_lineage_settings = string #(Optional) Specifies whether data lineage is enabled for the crawler. Valid values are: ENABLE and DISABLE. Default value is Disable.

  })
  default = null
}

variable "recrawl_policy" {
  description = "(Optional) A policy that specifies whether to crawl the entire dataset again, or to crawl only folders that were added since the last crawler run.. See Recrawl Policy below."
  type = object({
    recrawl_behavior = string #(Optional) Specifies whether to crawl the entire dataset again or to crawl only folders that were added since the last crawler run. Valid Values are: CRAWL_EVERYTHING and CRAWL_NEW_FOLDERS_ONLY. Default value is CRAWL_EVERYTHING.

  })
  default = null
}