output "id" {
  #{"type":"string","default":"test-bucket-new"}
  description = "The name of the bucket."
  value       = module.bucket.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:s3:::test-bucket-new"}
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.bucket.arn
}

output "bucket_domain_name" {
  #{"type":"string","default":"test-bucket-new.s3.amazonaws.com"}
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  #{"type":"string","default":"test-bucket-new.s3.us-east-2.amazonaws.com"}
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = module.bucket.bucket_regional_domain_name
}

output "hosted_zone_id" {
  #{"type":"string","default":"Z2O1EMRO9K5GLX"}  
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.bucket.hosted_zone_id
}

output "region" {
  #{"type":"string","default":"us-east-2"}
  description = "The AWS region this bucket resides in."
  value       = module.bucket.region
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.bucket.tags_all
}

output "website_endpoint" {
  #{"type":"string","default":"dummy"}
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = module.bucket.website_endpoint
}

output "website_domain" {
  #{"type":"string","default":"dummy"}
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
  value       = module.bucket.website_domain
}