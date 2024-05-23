output "arn" {
  description = "Amazon Resource Name (ARN) of the S3 Access Point."
  value       = aws_s3_access_point.s3_access_point.arn
}

output "domain_name" {
  description = "The DNS domain name of the S3 Access Point in the format name-account_id.s3-accesspoint.region.amazonaws.com. Note: S3 access points only support secure access by HTTPS. HTTP isn't supported."
  value       = aws_s3_access_point.s3_access_point.domain_name
}

output "has_public_access_policy" {
  description = "Indicates whether this access point currently has a policy that allows public access."
  value       = aws_s3_access_point.s3_access_point.has_public_access_policy
}

output "id" {
  description = "For Access Point of an AWS Partition S3 Bucket, the AWS account ID and access point name separated by a colon (:). For S3 on Outposts Bucket, the Amazon Resource Name (ARN) of the Access Point."
  value       = aws_s3_access_point.s3_access_point.id
}

output "network_origin" {
  description = "Indicates whether this access point allows access from the public Internet. Values are VPC (the access point doesn't allow access from the public Internet) and Internet (the access point allows access from the public Internet, subject to the access point and bucket access policies)."
  value       = aws_s3_access_point.s3_access_point.network_origin
}


