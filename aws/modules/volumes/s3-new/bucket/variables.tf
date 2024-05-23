variable "bucket" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  type        = string
  default     = null
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "policy" {
  description = "(Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}

variable "acceleration_status" {
  description = "(Optional) Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended."
  type        = string
  default     = null
}

variable "request_payer" {
  description = "(Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information."
  type        = string
  default     = null
}


variable "website" {
  type = object({
    index_document           = string #(Required, unless using redirect_all_requests_to) Amazon S3 returns this index document when requests are made to the root domain or and all of the subfolders.
    error_document           = string #(Optional) An absolute path to the document to return in case of a 4XX error.
    redirect_all_requests_to = string #(Optional) A hostname to redirect all website requests for this bucket to. Hostname can optionally be prefixed with a protocol (http:// or https://) to use when redirecting requests. The default is the protocol that is used in the original request.
    routing_rules            = string #(Optional) A json array containing routing rules describing redirect behavior and when redirects are applied.
  })
  description = "(Optional) A website object (documented below)."
  default     = null
}


variable "cors_rule" {
  type = object({
    allowed_headers = list(string) # (Optional) Specifies which headers are allowed.
    allowed_methods = list(string) #(Required) Specifies which methods are allowed.
    allowed_origins = list(string) #(Required) Specifies which origins are allowed.
    expose_headers  = list(string) #(Optional) Specifies expose header in the response.
    max_age_seconds = string       #(Optional) Specifies time in seconds that browser can cache the response for a preflight request.
  })
  description = "(Optional) A rule of Cross-Origin Resource Sharing (documented below)."
  default     = null
}

variable "versioning" {
  type = object({
    enabled    = bool # (Optional) Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket
    mfa_delete = bool #(Optional) Enable MFA delete for either Change the versioning state of your bucket or Permanently delete an object version. Default is false. This cannot be used to toggle this setting but is available to allow managed buckets to reflect the state in AWS

  })
  description = "(Optional) A state of versioning (documented below)"
  default     = null
}

variable "logging" {
  type = object({
    target_bucket = string # (Required) The name of the bucket that will receive the log objects.
    target_prefix = string #(Optional) To specify a key prefix for log objects.
  })
  description = "(Optional) A settings of bucket logging (documented below)."
  default     = null
}


variable "lifecycle_rule" {
  type = list(object({
    id                                     = string      #(Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length.
    prefix                                 = string      #(Optional) Object key prefix identifying one or more objects to which the rule applies.
    tags                                   = map(string) #(Optional) Specifies object tags key and value.
    enabled                                = bool        #(Required) Specifies lifecycle rule status.
    abort_incomplete_multipart_upload_days = string      #(Optional) Specifies the number of days after initiating a multipart upload when the multipart upload must be completed.
    expiration = object({
      date                         = string #(Optional) Specifies the date after which you want the corresponding action to take effect.
      days                         = string #(Optional) Specifies the number of days after object creation when the specific rule action takes effect.
      expired_object_delete_marker = string #(Optional) On a versioned bucket (versioning-enabled or versioning-suspended bucket), you can add this element in the lifecycle configuration to direct Amazon S3 to delete expired object delete markers. This cannot be specified with Days or Date in a Lifecycle Expiration Policy.
    })
    transition = list(object({
      date          = string #(Optional) Specifies the date after which you want the corresponding action to take effect.
      days          = string #(Optional) #Specifies the number of days after object creation when the specific rule action takes effect.
      storage_class = string #(Required) Specifies the Amazon S3 storage class to which you want the object to transition. 
    }))
    noncurrent_version_expiration = object({
      days = string #(Required) Specifies the number of days noncurrent object versions expire.
    })
    noncurrent_version_transition = list(object({
      days          = string #(Optional) #Specifies the number of days after object creation when the specific rule action takes effect.
      storage_class = string #(Required) Specifies the Amazon S3 storage class to which you want the noncurrent object versions to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE.
    }))
  }))
  description = "(Optional) A configuration of object lifecycle management (documented below)."
  default     = null
}

variable "replication_configuration" {
  type = list(object({
    role = string #(Required) The ARN of the IAM role for Amazon S3 to assume when replicating the objects.   
    rules = object({
      id       = string # (Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length.
      priority = string # (Optional) The priority associated with the rule.
      prefix   = string # (Optional) Object keyname prefix identifying one or more objects to which the rule applies. Must be less than or equal to 1024 characters in length.
      status   = string # (Required) The status of the rule. Either Enabled or Disabled. The rule is ignored if status is not Enabled.
      destination = object({
        bucket             = string #(Required) The ARN of the S3 bucket where you want Amazon S3 to store replicas of the object identified by the rule.
        storage_class      = string #(Optional) The class of storage used to store the object. Can be STANDARD, REDUCED_REDUNDANCY, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE.
        replica_kms_key_id = string #(Optional) Destination KMS encryption key ARN for SSE-KMS replication. Must be used in conjunction with sse_kms_encrypted_objects source selection criteria.
        account_id         = string # (Optional) The Account ID to use for overriding the object owner on replication. Must be used in conjunction with access_control_translation override configuration.
        access_control_translation = object({
          owner = string #(Required) The override value for the owner on replicated objects. Currently only Destination is supported.
        })
      })
      source_selection_criteria = object({
        sse_kms_encrypted_objects = object({
          enabled = string #(Required) Boolean which indicates if this criteria is enabled.
        })
      })

      filter = object({
        prefix = string      #(Optional) Object keyname prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length.
        tags   = map(string) #(Optional) A map of tags that identifies subset of objects to which the rule applies. The rule applies only to objects having all the tags in its tagset.
      })
    })
  }))
  description = "(Optional) A configuration of replication configuration (documented below)."
  default     = null
}


variable "server_side_encryption_configuration" {
  type = object({
    rule = object({
      apply_server_side_encryption_by_default = object({
        sse_algorithm     = string #(required) The server-side encryption algorithm to use. Valid values are AES256 and aws:kms
        kms_master_key_id = string #(optional) The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms.
      })
      bucket_key_enabled = bool # (Optional) Whether or not to use Amazon S3 Bucket Keys for SSE-KMS.
    })
  })
  description = "(Optional) A configuration of server-side encryption configuration (documented below)"
  default     = null

}

variable "object_lock_configuration" {
  type = object({
    object_lock_enabled = string #(Required) Indicates whether this bucket has an Object Lock configuration enabled. Valid value is Enabled.
    rule = object({
      default_retention = object({
        mode  = string #(Required) The default Object Lock retention mode you want to apply to new objects placed in this bucket. Valid values are GOVERNANCE and COMPLIANCE.
        days  = string #(Optional) The number of days that you want to specify for the default retention period.
        years = string #(Optional) The number of years that you want to specify for the default retention period.
      })
    })
  })
  description = "(Optional) A configuration of S3 object locking (documented below)"
  default     = null
}


variable "grant" {
  type = list(object({
    id          = string       #(optional) Canonical user id to grant for. Used only when type is CanonicalUser.
    type        = string       #(required) - Type of grantee to apply for. Valid values are CanonicalUser and Group. AmazonCustomerByEmail is not supported.
    permissions = list(string) #(required) List of permissions to apply for grantee. Valid values are READ, WRITE, READ_ACP, WRITE_ACP, FULL_CONTROL.
    uri         = string       #(optional) Uri address to grant for. Used only when type is Group.
  }))
  description = "(Optional) An ACL policy grant (documented below). Conflicts with acl."
  default     = null
}
