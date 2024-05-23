output "id" {
  description = "Name of the S3 bucket the configuration is attached to"
  value       = aws_s3_bucket_public_access_block.bucket_public_access_block.id
}




