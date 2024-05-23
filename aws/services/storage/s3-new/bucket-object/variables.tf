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
  description = "(Required) The name of the bucket to put the file in. Alternatively, an S3 access point ARN can be specified."
}

variable "key" {
  type        = string
  description = "(Required) The name of the object once it is in the bucket."
}

variable "source_id" {
  type        = string
  description = "(Optional, conflicts with content and content_base64) The path to a file that will be read and uploaded as raw bytes for the object content."
  default     = null
}

variable "content" {
  type        = string
  description = "(Optional, conflicts with source and content_base64) Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text."
  default     = null
}

variable "content_base64" {
  type        = string
  description = "(Optional, conflicts with source and content) Base64-encoded data that will be decoded and uploaded as raw bytes for the object content. This allows safely uploading non-UTF8 binary data, but is recommended only for small content such as the result of the gzipbase64 function with small text strings. For larger objects, use source to stream the content from a disk file."
  default     = null
}

variable "acl" {
  type        = string
  description = "(Optional) The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, and bucket-owner-full-control. Defaults to private."
  default     = null
}

variable "cache_control" {
  type        = string
  description = "(Optional) Specifies caching behavior along the request/reply chain Read w3c cache_control for further details."
  default     = null
}

variable "content_disposition" {
  type        = string
  description = "(Optional) Specifies presentational information for the object. Read w3c content_disposition for further information."
  default     = null
}

variable "content_encoding" {
  type        = string
  description = "(Optional) Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field. Read w3c content encoding for further information."
  default     = null
}

variable "content_language" {
  type        = string
  description = "(Optional) The language the content is in e.g. en-US or en-GB."
  default     = null
}

variable "content_type" {
  type        = string
  description = "(Optional) A standard MIME type describing the format of the object data, e.g. application/octet-stream. All Valid MIME Types are valid for this input."
  default     = null
}

variable "website_redirect" {
  type        = string
  description = "(Optional) Specifies a target URL for website redirect."
  default     = null
}

variable "storage_class" {
  type        = string
  description = "(Optional) Specifies the desired Storage Class for the object."
  default     = null
}

variable "etag" {
  type        = string
  description = "(Optional) Used to trigger updates."
  default     = null
}

variable "server_side_encryption" {
  type        = string
  description = "(Optional) Specifies server-side encryption of the object in S3. "
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) Amazon Resource Name (ARN) of the KMS Key to use for object encryption. If the S3 Bucket has server-side encryption enabled, that value will automatically be used. "
  default     = null
}

variable "bucket_key_enabled" {
  type        = bool
  description = "(Optional) Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
  default     = false
}

variable "metadata" {
  type        = map(string)
  description = "(Optional) A map of keys/values to provision metadata (will be automatically prefixed by x-amz-meta-, note that only lowercase label are currently supported by the AWS Go API)."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the object. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "force_destroy" {
  type        = bool
  description = "(Optional) Allow the object to be deleted by removing any legal hold on any object version. Default is false. This value should be set to true only if the bucket has S3 object lock enabled."
  default     = false
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

