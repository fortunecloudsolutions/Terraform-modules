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
  description = "(Required) Name of the MSK cluster."
  type        = string
}

variable "kafka_version" {
  description = "(Required) Specify the desired Kafka software version."
  type        = string
}

variable "number_of_broker_nodes" {
  description = "(Required) The desired total number of broker nodes in the kafka cluster. It must be a multiple of the number of specified client subnets."
  type        = number
}

variable "enhanced_monitoring" {
  description = "(Optional) Specify the desired enhanced MSK CloudWatch monitoring level. See Monitoring Amazon MSK with Amazon CloudWatch"
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(any)
  default     = null
}

variable "broker_node_group_info" {
  type = object({
    instance_type   = string       # (Required) Specify the instance type to use for the kafka brokers. e.g. kafka.m5.large.
    ebs_volume_size = string       # (Required) The size in GiB of the EBS volume for the data drive on each broker node.
    client_subnets  = list(string) # (Required) A list of subnets to connect to in client VPC (documentation).
    security_groups = list(string) # (Required) A list of the security groups to associate with the elastic network interfaces to control who can communicate with the cluster.
    az_distribution = string       # (Optional) The distribution of broker nodes across availability zones (documentation). Currently the only valid value is DEFAULT
  })
  description = "(Required) Configuration block for the broker nodes of the Kafka cluster."
}

variable "client_authentication" {
  description = "(Optional) Configuration block for specifying a client authentication. See below."
  type = object({
    tls = object({
      certificate_authority_arns = list(string) # (Optional) List of ACM Certificate Authority Amazon Resource Names (ARNs).
    })
    sasl = object({
      scram = bool # (Optional) Enables SCRAM client authentication via AWS Secrets Manager. Defaults to false.
    })
  })
  default = null
}

variable "configuration_info" {
  type = object({
    arn      = string # (Required) Amazon Resource Name (ARN) of the MSK Configuration to use in the cluster.
    revision = string # (Required) Revision of the MSK Configuration to use in the cluster.
  })
  description = "(Optional) Configuration block for specifying a MSK Configuration to attach to Kafka brokers. See below."
  default     = null
}

variable "encryption_info" {
  description = "(Optional) Configuration block for specifying encryption. See below."
  type = object({
    encryption_in_transit = object({
      client_broker = string # (Optional) Encryption setting for data in transit between clients and brokers. Valid values: TLS, TLS_PLAINTEXT, and PLAINTEXT. Default value is TLS.
      in_cluster    = bool   # (Optional) Whether data communication among broker nodes is encrypted. Default value: true.
    })
    encryption_at_rest_kms_key_arn = string # (Optional) You may specify a KMS key short ID or ARN (it will always output an ARN) to use for encrypting your data at rest. If no key is specified, an AWS managed KMS ('aws/msk' managed service) key will be used for encrypting the data at rest.
  })
  default = null
}

variable "open_monitoring" {
  description = "(Optional) Configuration block for JMX and Node monitoring for the MSK cluster. See below."
  type = object({
    prometheus = object({
      jmx_exporter = object({
        enabled_in_broker = bool #(Required) Indicates whether you want to enable or disable the JMX Exporter.
      })
      node_exporter = object({
        enabled_in_broker = bool #(Required) Indicates whether you want to enable or disable the Node Exporter.
      })
    })
  })
  default = null
}

variable "logging_info" {
  description = "(Optional) Configuration block for streaming broker logs to Cloudwatch/S3/Kinesis Firehose. See below."
  type = object({
    broker_logs = object({
      cloudwatch_logs = object({
        enabled   = bool   #(Optional) Indicates whether you want to enable or disable streaming broker logs to Cloudwatch Logs.
        log_group = string # (Optional) Name of the Cloudwatch Log Group to deliver logs to.
      })
      firehose = object({
        enabled         = bool   #(Optional) Indicates whether you want to enable or disable streaming broker logs to Kinesis Data Firehose.
        delivery_stream = string #(Optional) Name of the Kinesis Data Firehose delivery stream to deliver logs to. 
      })
      s3 = object({
        enabled = bool   #(Optional) Indicates whether you want to enable or disable streaming broker logs to S3.
        bucket  = string #(Optional) Name of the S3 bucket to deliver logs to.
        prefix  = string #(Optional) Prefix to append to the folder name.
      })
    })
  })
  default = null
}
