output "s3_bucket_id" {
  #{"type":"string","default":"s3-bucket"}
  description = "The name of the bucket."
  value       = module.s3_bucket.this_s3_bucket_id
}

output "s3_bucket_arn" {
  #{"type":"string","default":"arn:aws:s3:::logs-crucial-martin"}
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.s3_bucket.this_s3_bucket_arn
}

output "s3_bucket_role_name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the role"
  value       = module.s3_role.role_id
}

output "s3_bucket_role_arn" {
  #{"type":"string","default":"dummy"}
  description = " The Amazon Resource Name (ARN) specifying the role"
  value       = module.s3_role.role_arn
}

output "s3_bucket_bucket_domain_name" {
  #{"type":"string","default":"bucketname.s3.amazonaws.com"}
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.s3_bucket.this_s3_bucket_bucket_domain_name
}

output "s3_bucket_bucket_regional_domain_name" {
  #{"type":"string","default":"regional_name"}
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = module.s3_bucket.this_s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_hosted_zone_id" {
  #{"type":"string","default":"zone_id"}
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.s3_bucket.this_s3_bucket_hosted_zone_id
}

output "s3_bucket_region" {
  #{"type":"string","default":"us-east-2"}
  description = "The AWS region this bucket resides in."
  value       = module.s3_bucket.this_s3_bucket_region
}

output "s3_bucket_website_endpoint" {
  #{"type":"string","default":"s3-bucket.aws.com"}
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = module.s3_bucket.this_s3_bucket_website_endpoint
}

output "s3_bucket_website_domain" {
  #{"type":"string","default":"s3-bucket.aws.com"}
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. "
  value       = module.s3_bucket.this_s3_bucket_website_domain
}
