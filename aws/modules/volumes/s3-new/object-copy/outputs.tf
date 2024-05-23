output "etag" {
  description = "The ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. More information on possible values can be found on Common Response Headers."
  value       = aws_s3_object_copy.object_copy.etag
}

output "expiration" {
  description = "If the object expiration is configured, this attribute will be set."
  value       = aws_s3_object_copy.object_copy.expiration
}

output "id" {
  description = "The key of the resource supplied above."
  value       = aws_s3_object_copy.object_copy.id
}

output "last_modified" {
  description = "Returns the date that the object was last modified, in RFC3339 format."
  value       = aws_s3_object_copy.object_copy.last_modified
}

output "request_charged" {
  description = "If present, indicates that the requester was successfully charged for the request."
  value       = aws_s3_object_copy.object_copy.request_charged
}

output "source_version_id" {
  description = "Version of the copied object in the source bucket."
  value       = aws_s3_object_copy.object_copy.source_version_id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_s3_object_copy.object_copy.tags_all
}

output "version_id" {
  description = "Version ID of the newly created copy."
  value       = aws_s3_object_copy.object_copy.version_id

}