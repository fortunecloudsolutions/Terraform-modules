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

output "db_instance_address" {
  description = "The hostname of the RDS instance"
  value       = module.db_instance.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_instance.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db_instance.db_instance_availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint in address:port format"
  value       = module.db_instance.db_instance_endpoint
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = module.db_instance.db_instance_id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.db_instance.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = module.db_instance.db_instance_status
}

output "db_instance_name" {
  description = "The database name"
  value       = module.db_instance.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db_instance.db_instance_username
}

output "db_instance_port" {
  description = "The database port"
  value       = module.db_instance.db_instance_port
}

output "db_parameter_group_arn" {
  description = "The ARN of the DB parameter group"
  value       = module.db_instance.db_parameter_group_arn
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = module.db_instance.db_instance_domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service"
  value       = module.db_instance.db_instance_domain_iam_role_name
}

output "db_subnet_group_id" {
  description = "The DB subnet group name"
  value       = module.db_subnet_group.subnet_group_id
}

output "kms_key_id" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.kms_key.kms_key_id
}