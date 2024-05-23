output "etag" {
  #{"type":"string","default":"e30aa26efd332603c36e453fa893a45b"}
  description = "The ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. More information on possible values can be found on Common Response Headers."
  value       = module.object_copy.etag
}

output "expiration" {
  #{"type":"string","default":"dummy"}
  description = "If the object expiration is configured, this attribute will be set."
  value       = module.object_copy.expiration
}

output "id" {
  #{"type":"string","default":"testobject"}
  description = "The key of the resource supplied above."
  value       = module.object_copy.id
}

output "last_modified" {
  #{"type":"string","default":"2021-06-08T18:54:06Z"}
  description = "Returns the date that the object was last modified, in RFC3339 format."
  value       = module.object_copy.last_modified
}

output "request_charged" {
  #{"type":"bool","default":"false"}
  description = "If present, indicates that the requester was successfully charged for the request."
  value       = module.object_copy.request_charged
}

output "source_version_id" {
  #{"type":"string","default":"dummy"}
  description = "Version of the copied object in the source bucket."
  value       = module.object_copy.source_version_id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.object_copy.tags_all
}

output "version_id" {
  #{"type":"string","default":"dummy"}
  description = "Version ID of the newly created copy."
  value       = module.object_copy.version_id

}