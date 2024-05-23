resource "aws_s3_bucket_object" "bucket_object" {
  key                           = var.key
  bucket                        = var.bucket
  source                        = var.source_id
  object_lock_legal_hold_status = var.object_lock_legal_hold_status
  object_lock_mode              = var.object_lock_mode
  object_lock_retain_until_date = var.object_lock_retain_until_date
  force_destroy                 = var.force_destroy
  server_side_encryption        = var.server_side_encryption
  etag                          = var.etag
  content                       = var.content
  content_base64                = var.content_base64
  acl                           = var.acl
  cache_control                 = var.cache_control
  content_disposition           = var.content_disposition
  content_encoding              = var.content_encoding
  content_language              = var.content_language
  content_type                  = var.content_type
  website_redirect              = var.website_redirect
  storage_class                 = var.storage_class
  kms_key_id                    = var.kms_key_id
  bucket_key_enabled            = var.bucket_key_enabled
  metadata                      = var.metadata
  tags                          = var.tags

}