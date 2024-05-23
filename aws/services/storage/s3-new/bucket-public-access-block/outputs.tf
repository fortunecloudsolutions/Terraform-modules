output "id" {
  #{"type":"string","default":"test-bucket-new"}
  description = "Name of the S3 bucket the configuration is attached to"
  value       = module.bucket_public_access_block.id
}




