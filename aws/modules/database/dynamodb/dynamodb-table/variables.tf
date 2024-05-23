variable "name" {
  type        = string
  description = "(Required) The name of the table, this needs to be unique within a region."
}

variable "billing_mode" {
  type        = string
  description = "(Optional) Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED."
  default     = null
}

variable "hash_key" {
  type        = string
  description = "(Required, Forces new resource) The attribute to use as the hash (partition) key. Must also be defined as an attribute, see below."
}

variable "range_key" {
  type        = string
  description = "(Optional, Forces new resource) The attribute to use as the range (sort) key. Must also be defined as an attribute, see below."
  default     = null
}

variable "write_capacity" {
  type        = number
  description = "(Optional) The number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
  default     = null
}

variable "read_capacity" {
  type        = number
  description = "(Optional) The number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
  default     = null
}

variable "attribute" {
  type = list(object({
    name = string #(Required) The name of the attribute
    type = string #(Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data

  }))
  description = "(Required) List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties"
}

variable "ttl" {
  type = object({
    enabled        = bool   #(Required) Indicates whether ttl is enabled (true) or disabled (false).
    attribute_name = string #(Required) The name of the table attribute to store the TTL timestamp in.

  })
  description = "(Optional) Defines ttl, has two properties, and can only be specified once"
  default     = null
}

variable "local_secondary_index" {
  type = list(object({
    name               = string       #(Required) The name of the index
    range_key          = string       #(Required) The name of the range key; must be defined
    projection_type    = string       #(Required) One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY projects just the hash and range key into the index, and INCLUDE projects only the keys specified in the non_key_attributes parameter.
    non_key_attributes = list(string) #(Optional) Only required with INCLUDE as a projection type; a list of attributes to project into the index. These do not need to be defined as attributes on the table.

  }))
  description = "(Optional, Forces new resource) Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource."
  default     = null
}

variable "global_secondary_index" {
  type = list(object({
    name               = string       #(Required) The name of the index
    write_capacity     = number       #(Optional) The number of write units for this index. Must be set if billing_mode is set to PROVISIONED.
    read_capacity      = number       #(Optional) The number of read units for this index. Must be set if billing_mode is set to PROVISIONED.
    hash_key           = string       #(Required) The name of the hash key in the index; must be defined as an attribute in the resource.
    range_key          = string       #(Optional) The name of the range key; must be defined
    projection_type    = string       #((Required) One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY projects just the hash and range key into the index, and INCLUDE projects only the keys specified in the non_key_attributes parameter.
    non_key_attributes = list(string) #(Optional) Only required with INCLUDE as a projection type; a list of attributes to project into the index. These do not need to be defined as attributes on the table.


  }))
  description = "(Optional, Forces new resource) Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource."
  default     = null
}


variable "replica" {
  type = list(object({
    region_name = string #(Required) Region name of the replica.
    kms_key_arn = string #(Optional) The ARN of the CMK that should be used for the AWS KMS encryption.
  }))
  description = "(Optional) Configuration block(s) with DynamoDB Global Tables V2 (version 2019.11.21) replication configurations. Detailed below."
  default     = null
}

variable "server_side_encryption" {
  type = object({
    enabled     = bool   #(Required) Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK).
    kms_key_arn = string #(Optional) The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb.
  })
  description = "(Optional) Encryption at rest options. AWS DynamoDB tables are automatically encrypted at rest with an AWS owned Customer Master Key if this argument isn't specified."
  default     = null
}

variable "point_in_time_recovery" {
  type = object({
    enabled = bool #(Required) Whether to enable point-in-time recovery - note that it can take up to 10 minutes to enable for new tables. If the point_in_time_recovery block is not provided then this defaults to false.ssssss

  })
  description = "(Optional) Point-in-time recovery options."
  default     = null
}

variable "stream_enabled" {
  type        = bool
  description = "(Optional) Indicates whether Streams are to be enabled (true) or disabled (false)."
  default     = null
}

variable "stream_view_type" {
  type        = string
  description = "(Optional) When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = " (Optional) A map of tags to populate on the created table. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}

variable "timeouts" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = string # (Default 10m) Used when creating the table
    update = string # (Default 60m) Used when updating the table configuration and reset for each individual Global Secondary Index and Replica update
    delete = string # (Default 10m) Used when deleting the table
  })
}
