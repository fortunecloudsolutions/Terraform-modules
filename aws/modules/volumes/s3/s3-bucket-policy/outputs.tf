output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket_policy.this[0].id
}