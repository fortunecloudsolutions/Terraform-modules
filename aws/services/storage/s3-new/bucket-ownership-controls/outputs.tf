output "id" {
  #{"type":"string","default":"test-bucket-new"}
  description = "S3 Bucket name."
  value       = module.bucket_ownership_controls.id
}




