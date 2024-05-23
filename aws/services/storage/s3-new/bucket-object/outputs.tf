output "id" {
  #{"type":"string","default":"testobject"}
  description = "the key of the resource supplied above"
  value       = module.bucket_object.id
}

output "etag" {
  #{"type":"string","default":"e30aa26efd332603c36e453fa893a45b"}
  description = "the ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. "
  value       = module.bucket_object.etag
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.bucket_object.tags_all
}

output "version_id" {
  #{"type":"string","default":"dummy"}
  description = "A unique version ID value for the object, if bucket versioning is enabled."
  value       = module.bucket_object.version_id
}



