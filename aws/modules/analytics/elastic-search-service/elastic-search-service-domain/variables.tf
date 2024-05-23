variable "domain_name" {
  type        = string
  description = "(Required) Name of the domain."
}

variable "access_policies" {
  type        = string
  description = "(Optional) IAM policy document specifying the access policies for the domain."
  default     = null
}

variable "advanced_options" {
  type        = map(string)
  description = "(Optional) Key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your Elasticsearch domain on every apply."
  default     = {}
}

variable "elasticsearch_version" {
  type        = string
  description = "(Optional) Version of Elasticsearch to deploy. Defaults to 1.5."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "advanced_security_options" {
  type = object({
    enabled                        = bool #(Required, Forces new resource) Whether advanced security is enabled.
    internal_user_database_enabled = bool #(Optional, Default: false) Whether the internal user database is enabled. If not set, defaults to false by the AWS API.

    master_user_options = object({
      master_user_arn      = string #(Optional) ARN for the main user. Only specify if internal_user_database_enabled is not set or set to false.
      master_user_name     = string # (Optional) Main user's username, which is stored in the Amazon Elasticsearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true.
      master_user_password = string #(Optional) Main user's password, which is stored in the Amazon Elasticsearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true.
    })
  })
  description = "(Optional) Configuration block for fine-grained access control. Detailed below."
  default     = null
}

variable "cluster_config" {
  type = object({
    dedicated_master_count   = number # (Optional) Number of dedicated main nodes in the cluster.
    dedicated_master_enabled = bool   # (Optional) Whether dedicated main nodes are enabled for the cluster.
    dedicated_master_type    = string # (Optional) Instance type of the dedicated main nodes in the cluster.
    instance_count           = number # (Optional) Number of instances in the cluster.
    instance_type            = string # (Optional) Instance type of data nodes in the cluster.
    warm_count               = number # (Optional) Number of warm nodes in the cluster. Valid values are between 2 and 150. warm_count can be only and must be set when warm_enabled is set to true.
    warm_enabled             = bool   # (Optional) Whether to enable warm storage.
    warm_type                = string # (Optional) Instance type for the Elasticsearch cluster's warm nodes. Valid values are ultrawarm1.medium.elasticsearch, ultrawarm1.large.elasticsearch and ultrawarm1.xlarge.elasticsearch. warm_type can be only and must be set when warm_enabled is set to true.
    zone_awareness_enabled   = bool   # (Optional) Whether zone awareness is enabled, set to true for multi-az deployment. To enable awareness with three Availability Zones, the availability_zone_count within the zone_awareness_config must be set to 3.
    zone_awareness_config = object({
      availability_zone_count = number # (Optional) Number of Availability Zones for the domain to use with zone_awareness_enabled. Defaults to 2. Valid values: 2 or 3.

    })
  })
  description = "(Optional) Configuration block for the cluster of the domain. Detailed below."
  default     = null
}

variable "cognito_options" {
  type = object({
    enabled          = bool   #(Optional, Default: false) Whether Amazon Cognito authentication with Kibana is enabled or not.
    identity_pool_id = string #(Required) ID of the Cognito Identity Pool to use.
    role_arn         = string #(Required) ARN of the IAM role that has the AmazonESCognitoAccess policy attached.
    user_pool_id     = string # (Required) ID of the Cognito User Pool to use.
  })
  description = "(Optional) Configuration block for authenticating Kibana with Cognito. Detailed below."
  default     = null
}

variable "domain_endpoint_options" {
  type = object({
    custom_endpoint_certificate_arn = string #Optional) ACM certificate ARN for your custom endpoint.
    custom_endpoint_enabled         = bool   # (Optional) Whether to enable custom endpoint for the Elasticsearch domain.
    custom_endpoint                 = string # (Optional) Fully qualified domain for your custom endpoint.
    enforce_https                   = bool   #(Optional) Whether or not to require HTTPS. Defaults to true.
    tls_security_policy             = string # (Optional) Name of the TLS security policy that needs to be applied to the HTTPS endpoint. Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07. Terraform will only perform drift detection if a configuration value is provided.

  })
  description = "(Optional) Configuration block for domain endpoint HTTP(S) related options. Detailed below."
  default     = null
}

variable "ebs_options" {
  type = object({
    ebs_enabled = bool   # (Required) Whether EBS volumes are attached to data nodes in the domain.
    iops        = number # (Optional) Baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type.
    volume_size = number # (Required if ebs_enabled is set to true.) Size of EBS volumes attached to data nodes (in GiB).
    volume_type = string # (Optional) Type of EBS volumes attached to data nodes.

  })
  description = "(Optional) Configuration block for authenticating Kibana with Cognito. Detailed below."
  default     = null
}

variable "encrypt_at_rest" {
  type = object({
    enabled    = bool   #(Required) Whether to enable encryption at rest. If the encrypt_at_rest block is not provided then this defaults to false.
    kms_key_id = string #(Optional) KMS key id to encrypt the Elasticsearch domain with. If not specified then it defaults to using the aws/es service KMS key.
  })
  description = "(Optional) Configuration block for encrypt at rest options. Only available for certain instance types. Detailed below.."
  default     = null
}

variable "log_publishing_options" {
  type = object({
    cloudwatch_log_group_arn = string #(Required) ARN of the Cloudwatch log group to which log needs to be published.
    enabled                  = bool   #(Optional, Default: true) Whether given log publishing option is enabled or not.
    log_type                 = string #(Required) Type of Elasticsearch log. Valid values: INDEX_SLOW_LOGS, SEARCH_SLOW_LOGS, ES_APPLICATION_LOGS, AUDIT_LOGS.
  })
  description = "(Optional) Configuration block for publishing slow and application logs to CloudWatch Logs. This block can be declared multiple times, for each log_type, within the same resource. Detailed below."
  default     = null
}

variable "node_to_node_encryption" {
  type = object({
    enabled = bool # (Required) Whether to enable node-to-node encryption. If the node_to_node_encryption block is not provided then this defaults to false.
  })
  description = "(Optional) Configuration block for node-to-node encryption options. Detailed below."
  default     = null
}

variable "snapshot_options" {
  type = object({
    automated_snapshot_start_hour = number # (Required) Hour during which the service takes an automated daily snapshot of the indices in the domain.
  })
  description = "(Optional) Configuration block for snapshot related options. Detailed below."
  default     = null
}

variable "vpc_options" {
  type = object({
    security_group_ids = list(string) #(Optional) List of VPC Security Group IDs to be applied to the Elasticsearch domain endpoints. If omitted, the default Security Group for the VPC will be used.
    subnet_ids         = list(string) #(Required) List of VPC Subnet IDs for the Elasticsearch domain endpoints to be created in.
  })
  description = "(Optional) Configuration block for VPC related options. Adding or removing this configuration forces a new resource (documentation). Detailed below."
  default     = null
}

variable "timeouts" {
  description = "aws_elasticsearch_domain provides the following Timeouts configuration options:"
  type = object({
    update = string #(Optional, Default: 60m) How long to wait for updates.   
  })
}