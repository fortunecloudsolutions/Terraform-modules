variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type = string
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type = bool
}

variable "instance_tenancy" {
  description = "The instance tenancy attribute"
  type = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type = list(string)
}

variable "map_publicip" {
  description = "Whether to map public IP on subnet"
  type = bool
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on subnet creation"
  type = bool
}

variable "private_subnet_a" {
  description = "List of private subnet CIDR blocks for availability zone A"
  type = list(string)
}

variable "private_subnet_b" {
  description = "List of private subnet CIDR blocks for availability zone B"
  type = list(string)
}

variable "route_destination_cidr_block" {
  description = "Destination CIDR block for the route"
  type = string
}

variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type = list(string)
}

variable "s3_acl" {
  description = "ACL for S3 buckets"
  type = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type = string
}

variable "key_name" {
  description = "Key name for EC2 instances"
  type = string
}

variable "security_group_ids" {
  description = "Security group IDs for EC2 instances"
  type = map(list(string))
}

variable "alb_names" {
  description = "List of ALB names"
  type = list(string)
}

variable "alb_internal" {
  description = "Whether the ALB is internal"
  type = bool
}

variable "alb_security_group_ids" {
  description = "Security group IDs for ALBs"
  type = map(list(string))
}

variable "alb_idle_timeout" {
  description = "Idle timeout for ALBs"
  type = number
}

variable "enable_alb_delete_via_awsapi" {
  description = "Enable ALB deletion via AWS API"
  type = bool
}

variable "alb_ip_address_type" {
  description = "IP address type for ALBs"
  type = string
}

variable "access_log_bucket_name" {
  description = "S3 bucket name for ALB access logs"
  type = string
}

variable "enable_access_logs" {
  description = "Enable access logs for ALBs"
  type = bool
}

variable "target_group_names" {
  description = "List of target group names"
  type = list(string)
}

variable "target_ports" {
  description = "Ports for target groups"
  type = map(number)
}

variable "target_protocol" {
  description = "Protocol for target groups"
  type = string
}

variable "deregistration_delay" {
  description = "Deregistration delay for target groups"
  type = number
}

variable "slow_start" {
  description = "Slow start duration for target groups"
  type = number
}

variable "load_balancing_algorithm_type" {
  description = "Load balancing algorithm type for target groups"
  type = string
}

variable "target_type" {
  description = "Target type for target groups"
  type = string
}

variable "sticky_type" {
  description = "Sticky session type for target groups"
  type = string
}

variable "sticky_cookie_duration" {
  description = "Sticky session cookie duration for target groups"
  type = number
}

variable "sticky_enabled" {
  description = "Enable sticky sessions for target groups"
  type = bool
}

variable "health_check_enabled" {
  description = "Enable health checks for target groups"
  type = bool
}

variable "health_check_interval" {
  description = "Health check interval for target groups"
  type = number
}

variable "health_check_path" {
  description = "Health check path for target groups"
  type = string
}

variable "health_check_port" {
  description = "Health check port for target groups"
  type = string
}

variable "health_check_protocol" {
  description = "Health check protocol for target groups"
  type = string
}

variable "health_check_timeout" {
  description = "Health check timeout for target groups"
  type = number
}

variable "healthy_threshold" {
  description = "Healthy threshold for target groups"
  type = number
}

variable "unhealthy_threshold" {
  description = "Unhealthy threshold for target groups"
  type = number
}

variable "health_check_success_resp_code" {
  description = "Success response code for health checks"
  type = string
}

variable "ingress1_rule_no" {
  description = "Rule number for ingress NACL"
  type = number
}

variable "ingress1_fport" {
  description = "From port for ingress NACL"
  type = number
}

variable "ingress1_tport" {
  description = "To port for ingress NACL"
  type = number
}

variable "ingress1_protocol" {
  description = "Protocol for ingress NACL"
  type = string
}

variable "ingress1_cidr" {
  description = "CIDR block for ingress NACL"
  type = string
}

variable "ingress1_action" {
  description = "Action for ingress NACL"
  type = string
}

variable "ingress1_ipv6_cidr" {
  description = "IPv6 CIDR block for ingress NACL"
  type = string
}

variable "ingress1_icmp_type" {
  description = "ICMP type for ingress NACL"
  type = number
}

variable "ingress1_icmp_code" {
  description = "ICMP code for ingress NACL"
  type = number
}

variable "egress1_rule_no" {
  description = "Rule number for egress NACL"
  type = number
}

variable "egress1_fport" {
  description = "From port for egress NACL"
  type = number
}

variable "egress1_tport" {
  description = "To port for egress NACL"
  type = number
}

variable "egress1_protocol" {
  description = "Protocol for egress NACL"
  type = string
}

variable "egress1_cidr" {
  description = "CIDR block for egress NACL"
  type = string
}

variable "egress1_action" {
  description = "Action for egress NACL"
  type = string
}

variable "egress1_ipv6_cidr" {
  description = "IPv6 CIDR block for egress NACL"
  type = string
}

variable "egress1_icmp_type" {
  description = "ICMP type for egress NACL"
  type = number
}

variable "egress1_icmp_code" {
  description = "ICMP code for egress NACL"
  type = number
}

variable "sg_names" {
  description = "List of security group names"
  type = list(string)
}

variable "sg_descriptions" {
  description = "Descriptions for security groups"
  type = map(string)
}

variable "security_group_descriptions" {
  description = "Descriptions for security group rules"
  type = map(object({
    ingress_desc = string
    ingress_fport = number
    ingress_tport = number
    ingress_protocol = string
    ingress_cidr = string
    ingress_ipv6_cidr = string
    ingress_prefix_ids = list(string)
    ingress_security_groups = list(string)
    egress_desc = string
    egress_fport = number
    egress_tport = number
    egress_protocol = string
    egress_cidr = string
    egress_ipv6_cidr = string
    egress_prefix_ids = list(string)
    egress_security_groups = list(string)
  }))
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type = string
}

variable "db_subnet_group_description" {
  description = "DB subnet group description"
  type = string
}

variable "db_identifier" {
  description = "DB instance identifier"
  type = string
}

variable "db_allow_major_version_upgrade" {
  description = "Allow major version upgrade for DB instance"
  type = bool
}

variable "db_auto_minor_version_upgrade" {
  description = "Allow minor version upgrade for DB instance"
  type = bool
}

variable "db_engine" {
  description = "DB engine"
  type = string
}

variable "db_engine_version" {
  description = "DB engine version"
  type = string
}

variable "db_instance_class" {
  description = "DB instance class"
  type = string
}

variable "db_allocated_storage" {
  description = "Allocated storage for DB instance"
  type = number
}

variable "db_storage_encrypted" {
  description = "Whether DB storage is encrypted"
  type = bool
}

variable "db_parameter_group_name" {
  description = "DB parameter group name"
  type = string
}

variable "db_option_group_name" {
  description = "DB option group name"
  type = string
}

variable "db_name" {
  description = "DB name"
  type = string
}

variable "db_username" {
  description = "DB username"
  type = string
}

variable "db_password" {
  description = "DB password"
  type = string
}

variable "db_port" {
  description = "DB port"
  type = number
}

variable "db_copy_tags_to_snapshot" {
  description = "Copy tags to DB snapshot"
  type = bool
}

variable "db_monitoring_interval" {
  description = "Monitoring interval for DB instance"
  type = number
}

variable "db_publicly_accessible" {
  description = "Whether DB instance is publicly accessible"
  type = bool
}

variable "db_storage_type" {
  description = "DB storage type"
  type = string
}

variable "db_domain" {
  description = "DB domain"
  type = string
}

variable "db_domain_iam_role_name" {
  description = "IAM role name for DB domain"
  type = string
}

variable "db_multi_az" {
  description = "Whether DB instance is multi-AZ"
  type = bool
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot on DB deletion"
  type = bool
}

variable "db_vpc_security_group_id" {
  description = "VPC security group ID for DB instance"
  type = string
}

variable "db_backup_retention_period" {
  description = "Backup retention period for DB instance"
  type = number
}

variable "db_license_model" {
  description = "License model for DB instance"
  type = string
}

variable "db_apply_immediately" {
  description = "Apply changes immediately for DB instance"
  type = bool
}

variable "db_availability_zone" {
  description = "Availability zone for DB instance"
  type = string
}

variable "db_backup_window" {
  description = "Backup window for DB instance"
  type = string
}

variable "db_ca_cert_identifier" {
  description = "CA certificate identifier for DB instance"
  type = string
}

variable "db_delete_automated_backups" {
  description = "Delete automated backups on DB deletion"
  type = bool
}

variable "db_deletion_protection" {
  description = "Enable deletion protection for DB instance"
  type = bool
}

variable "db_final_snapshot_identifier" {
  description = "Final snapshot identifier for DB instance"
  type = string
}

variable "db_iam_database_authentication_enabled" {
  description = "Enable IAM database authentication for DB instance"
  type = bool
}

variable "db_iops" {
  description = "IOPS for DB instance"
  type = number
}

variable "kms_description" {
  description = "KMS key description"
  type = string
}

variable "kms_key_usage" {
  description = "KMS key usage"
  type = string
}

variable "kms_customer_master_key_spec" {
  description = "KMS customer master key spec"
  type = string
}

variable "kms_policy" {
  description = "KMS key policy"
  type = string
}

variable "kms_deletion_window_in_days" {
  description = "KMS key deletion window in days"
  type = number
}

variable "kms_is_enabled" {
  description = "Whether KMS key is enabled"
  type = bool
}

variable "kms_enable_key_rotation" {
  description = "Enable key rotation for KMS key"
  type = bool
}
