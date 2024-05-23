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

variable "bucket" {
  type        = string
  description = "(Required) Name of the bucket to put the file in."
}

variable "key" {
  type        = string
  description = "(Required) Name of the object once it is in the bucket."
}

variable "source_bucket" {
  type        = string
  description = "(Required) Specifies the source object for the copy operation. You specify the value in one of two formats. For objects not accessed through an access point, specify the name of the source bucket and the key of the source object, separated by a slash (/). For example, testbucket/test1.json."
}

variable "acl" {
  type        = string
  description = "(Optional) Canned ACL to apply. Defaults to private. Valid values are private, public-read, public-read-write, authenticated-read, aws-exec-read, bucket-owner-read, and bucket-owner-full-control. Conflicts with grant."
  default     = null
}

variable "cache_control" {
  type        = string
  description = "(Optional) Specifies caching behavior along the request/reply chain Read w3c cache_control for further details."
  default     = null
}

variable "content_disposition" {
  type        = string
  description = "(Optional) Specifies presentational information for the object. Read w3c content_disposition for further information.."
  default     = null
}

variable "content_encoding" {
  type        = string
  description = "(Optional) Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field."
  default     = null
}

variable "content_language" {
  type        = string
  description = "(Optional) Language the content is in e.g. en-US or en-GB."
  default     = null
}

variable "content_type" {
  type        = string
  description = "(Optional) Standard MIME type describing the format of the object data, e.g. application/octet-stream. All Valid MIME Types are valid for this input."
  default     = null
}

variable "copy_if_match" {
  type        = string
  description = "(Optional) Copies the object if its entity tag (ETag) matches the specified tag."
  default     = null
}

variable "copy_if_modified_since" {
  type        = string
  description = "(Optional) Copies the object if it has been modified since the specified time, in RFC3339 format."
  default     = null
}

variable "copy_if_none_match" {
  type        = string
  description = "(Optional) Copies the object if its entity tag (ETag) is different than the specified ETag."
  default     = null
}

variable "copy_if_unmodified_since" {
  type        = string
  description = "(Optional) Copies the object if it hasn't been modified since the specified time, in RFC3339 format."
  default     = null
}

variable "customer_algorithm" {
  type        = string
  description = "(Optional) Specifies the algorithm to use to when encrypting the object (for example, AES256)."
  default     = null
}

variable "customer_key" {
  type        = string
  description = "(Optional) Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side-encryption-customer-algorithm header."
  default     = null
}

variable "customer_key_md5" {
  type        = string
  description = "(Optional) Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error."
  default     = null
}

variable "expected_bucket_owner" {
  type        = string
  description = "(Optional) Account id of the expected destination bucket owner. If the destination bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error."
  default     = null
}

variable "expected_source_bucket_owner" {
  type        = string
  description = "(Optional) Account id of the expected source bucket owner. If the source bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error."
  default     = null
}

variable "expires" {
  type        = string
  description = "(Optional) Date and time at which the object is no longer cacheable, in RFC3339 format."
  default     = null
}

variable "force_destroy" {
  type        = bool
  description = "(Optional) Allow the object to be deleted by removing any legal hold on any object version. Default is false. This value should be set to true only if the bucket has S3 object lock enabled."
  default     = false
}

variable "kms_encryption_context" {
  type        = string
  description = "(Optional) Specifies the AWS KMS Encryption Context to use for object encryption. The value is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs."
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) Specifies the AWS KMS Key ARN to use for object encryption. This value is a fully qualified ARN of the KMS Key. If using aws_kms_key, use the exported arn attribute: kms_key_id = aws_kms_key.foo.arn"
  default     = null
}

variable "metadata" {
  type        = map(string)
  description = "(Optional) A map of keys/values to provision metadata (will be automatically prefixed by x-amz-meta-, note that only lowercase label are currently supported by the AWS Go API)."
  default     = {}
}

variable "metadata_directive" {
  type        = string
  description = "(Optional) Specifies whether the metadata is copied from the source object or replaced with metadata provided in the request. Valid values are COPY and REPLACE."
  default     = null
}

variable "object_lock_legal_hold_status" {
  type        = string
  description = "(Optional) The legal hold status that you want to apply to the specified object. Valid values are ON and OFF."
  default     = null
}

variable "object_lock_mode" {
  type        = string
  description = "(Optional) The object lock retention mode that you want to apply to this object. Valid values are GOVERNANCE and COMPLIANCE."
  default     = null
}

variable "object_lock_retain_until_date" {
  type        = string
  description = "(Optional) The date and time, in RFC3339 format, when this object's object lock will expire."
  default     = null
}

variable "request_payer" {
  type        = string
  description = "(Optional) Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. "
  default     = null
}

variable "server_side_encryption" {
  type        = string
  description = "(Optional) Specifies server-side encryption of the object in S3. Valid values are AES256 and aws:kms."
  default     = null
}

variable "source_customer_algorithm" {
  type        = string
  description = "(Optional) Specifies the algorithm to use when decrypting the source object (for example, AES256)."
  default     = null
}

variable "source_customer_key" {
  type        = string
  description = "(Optional) Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created."
  default     = null
}

variable "source_customer_key_md5" {
  type        = string
  description = "(Optional) Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error."
  default     = null
}

variable "storage_class" {
  type        = string
  description = "(Optional) Specifies the desired Storage Class for the object. Can be either STANDARD, REDUCED_REDUNDANCY, ONEZONE_IA, INTELLIGENT_TIERING, GLACIER, DEEP_ARCHIVE, or STANDARD_IA. Defaults to STANDARD."
  default     = null
}

variable "tagging_directive" {
  type        = string
  description = "(Optional) Specifies whether the object tag-set are copied from the source object or replaced with tag-set provided in the request. Valid values are COPY and REPLACE."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the object. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "website_redirect" {
  type        = string
  description = "(Optional) Specifies a target URL for website redirect."
  default     = null
}

variable "grant" {
  type = object({
    permissions = list(string) #(Required) List of permissions to grant to grantee. Valid values are READ, READ_ACP, WRITE_ACP, FULL_CONTROL.
    type        = string #(Required) - Type of grantee. Valid values are CanonicalUser, Group, and AmazonCustomerByEmail.
    email       = string #(Optional) Email address of the grantee. Used only when type is AmazonCustomerByEmail.
    id          = string #(Optional) The canonical user ID of the grantee. Used only when type is CanonicalUser.
    uri         = string #(Optional) URI of the grantee group. Used only when type is Group.
  })
  description = "(Optional) Configuration block for header grants. Documented below. Conflicts with acl."
  default     = null
}