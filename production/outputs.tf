output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_production.vpc_id
}

output "subnet_ids_az_a" {
  description = "The IDs of the subnets in AZ A"
  value       = module.subnets_production_az_a[*].subnet_id
}

output "subnet_ids_az_b" {
  description = "The IDs of the subnets in AZ B"
  value       = module.subnets_production_az_b[*].subnet_id
}

output "route_table_id" {
  description = "The ID of the route table"
  value       = module.route_table_production.id
}

output "s3_bucket_ids" {
  description = "The IDs of the S3 buckets"
  value       = module.s3_buckets[*].this_s3_bucket_id
}

output "ec2_instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = module.ec2_instances[*].instance_id
}

output "alb_arns" {
  description = "The ARNs of the Application Load Balancers"
  value       = module.load_balancers[*].alb_arn
}

output "target_group_arns" {
  description = "The ARNs of the Target Groups"
  value       = module.target_groups[*].target_arn
}

output "nacl_id" {
  description = "The ID of the Network ACL"
  value       = module.network_acl.nacl_id
}

output "security_group_ids" {
  description = "The IDs of the Security Groups"
  value       = module.security_groups[*].sg_id
}
