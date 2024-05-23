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

variable "cluster_identifier" {
  type        = string
  description = "(Required) The Cluster Identifier. Must be a lower case string."
}

variable "database_name" {
  type        = string
  description = "(Optional) The name of the first database to be created when the cluster is created. If you do not provide a name, Amazon Redshift will create a default database called dev."
  default     = "dev"
}

variable "node_type" {
  type        = string
  description = "(Required) The node type to be provisioned for the cluster."
}

variable "cluster_type" {
  type        = string
  description = "(Optional) The cluster type to use. Either single-node or multi-node."
  default     = null
}

variable "master_password" {
  type        = string
  description = "(Required unless a snapshot_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Password must contain at least 8 chars and contain at least one uppercase letter, one lowercase letter, and one number."

}

variable "master_username" {
  type        = string
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user."
}

variable "cluster_security_groups" {
  type        = list(string)
  description = "(Optional) A list of security groups to be associated with this cluster."
  default     = []
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "(Optional) A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster."
  default     = []
}

variable "cluster_subnet_group_name" {
  type        = string
  description = "(Optional) The name of a cluster subnet group to be associated with this cluster. If this parameter is not provided the resulting cluster will be deployed outside virtual private cloud (VPC)."
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "(Optional) The EC2 Availability Zone (AZ) in which you want Amazon Redshift to provision the cluster. For example, if you have several EC2 instances running in a specific Availability Zone, then you might want the cluster to be provisioned in the same zone in order to decrease network latency."
  default     = null
}

variable "preferred_maintenance_window" {
  type        = string
  description = "(Optional) The weekly time range (in UTC) during which automated cluster maintenance can occur. Format: ddd:hh24:mi-ddd:hh24:mi"
  default     = null
}

variable "cluster_parameter_group_name" {
  type        = string
  description = "(Optional) The name of the parameter group to be associated with this cluster."
  default     = null
}

variable "automated_snapshot_retention_period" {
  type        = number
  description = "(Optional) The number of days that automated snapshots are retained. If the value is 0, automated snapshots are disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you want with create-cluster-snapshot. Default is 1."
  default     = 1
}

variable "port" {
  type        = string
  description = "(Optional) The port number on which the cluster accepts incoming connections. The cluster is accessible only via the JDBC and ODBC connection strings. Part of the connection string requires the port on which the cluster will listen for incoming connections. Default port is 5439."
  default     = "5439"
}

variable "cluster_version" {
  type        = string
  description = "(Optional) The version of the Amazon Redshift engine software that you want to deploy on the cluster. The version selected runs on all the nodes in the cluster."
  default     = null
}

variable "allow_version_upgrade" {
  type        = bool
  description = "(Optional) If true , major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster. Default is true"
  default     = true
}

variable "number_of_nodes" {
  type        = number
  description = "(Optional) The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node. Default is 1."
  default     = 1
}

variable "publicly_accessible" {
  type        = bool
  description = "(Optional) If true, the cluster can be accessed from a public network. Default is true."
  default     = true
}

variable "encrypted" {
  type        = bool
  description = "(Optional) If true , the data in the cluster is encrypted at rest."
  default     = false
}

variable "enhanced_vpc_routing" {
  type        = bool
  description = "(Optional) If true , enhanced VPC routing is enabled."
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
  default     = null
}

variable "elastic_ip" {
  type        = string
  description = "(Optional) The Elastic IP (EIP) address for the cluster."
  default     = null
}

variable "skip_final_snapshot" {
  type        = bool
  description = "(Optional) Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster. If true , a final cluster snapshot is not created. If false , a final cluster snapshot is created before the cluster is deleted. Default is false."
  default     = false
}

variable "final_snapshot_identifier" {
  type        = string
  description = "(Optional) The identifier of the final snapshot that is to be created immediately before deleting the cluster. If this parameter is provided, skip_final_snapshot must be false."
  default     = null
}

variable "snapshot_identifier" {
  type        = string
  description = "(Optional) The name of the snapshot from which to create the new cluster."
  default     = null
}

variable "snapshot_cluster_identifier" {
  type        = string
  description = "(Optional) The name of the cluster the source snapshot was created from."
  default     = null
}

variable "owner_account" {
  type        = string
  description = "(Optional) The AWS customer account used to create or copy the snapshot. Required if you are restoring a snapshot you do not own, optional if you own the snapshot."
  default     = null
}

variable "iam_roles" {
  type        = list(string)
  description = "(Optional) A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) The AWS customer account used to create or copy the snapshot. Required if you are restoring a snapshot you do not own, optional if you own the snapshot."
  default     = {}
}

variable "logging" {
  description = "(Optional) Logging, documented below."

  type = object({
    enable        = number #(Required) Enables logging information such as queries and connection attempts, for the specified Amazon Redshift cluster.
    bucket_name   = string #(Optional, required when enable is true) The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions. 
    s3_key_prefix = string # (Optional) The prefix applied to the log file names.
  })

  default = null
}

variable "snapshot_copy" {
  description = "(Optional) Configuration of automatic copy of snapshots from one region to another. Documented below."

  type = object({
    destination_region = string #(Required) The destination region that you want to copy snapshots to.
    retention_period   = number # (Optional) The number of days to retain automated snapshots in the destination region after they are copied from the source region. Defaults to 7.
    grant_name         = string # (Optional) The name of the snapshot copy grant to use when snapshots of an AWS KMS-encrypted cluster are copied to the destination region.
  })

  default = null
}

variable "timeouts" {
  description = "aws_redshift_cluster provides the following Timeouts configuration options"
  type = object({
    create = string # (Default 75 minutes) Used for creating Clusters.
    update = string # (Default 75 minutes) Used for updating Clusters.
    delete = string # (Default 40 minutes) Used for destroying Clusters.
  })
}