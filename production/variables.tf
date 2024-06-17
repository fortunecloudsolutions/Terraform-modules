variable "env" {
  description = "The environment name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
}

variable "instance_tenancy" {
  description = "The instance tenancy attribute for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
}

variable "map_publicip" {
  description = "Map public IP on launch"
  type        = bool
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on subnet creation"
  type        = bool
}

variable "subnets_az_a_cidr" {
  description = "List of CIDR blocks for subnets in AZ A"
  type        = map(string)
}

variable "subnets_az_b_cidr" {
  description = "List of CIDR blocks for subnets in AZ B"
  type        = map(string)
}

variable "route_destination_cidr_block" {
  description = "CIDR block for the route"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "bucket_names" {
  description = "The list of bucket names"
  type        = list(string)
}

variable "s3_acl" {
  description = "The ACL for the S3 buckets"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
}

variable "security_group_ids" {
  description = "The list of security group IDs"
  type        = map(list(string))
}

variable "key_name" {
  description = "The key name for the EC2 instances"
  type        = string
}

variable "alb_names" {
  description = "The list of ALB names"
  type        = list(string)
}

variable "alb_internal" {
  description = "Whether the ALB is internal"
  type        = bool
}

variable "alb_security_group_ids" {
  description = "The security group IDs for the ALBs"
  type        = map(list(string))
}

variable "alb_idle_timeout" {
  description = "The idle timeout for the ALB"
  type        = number
}

variable "enable_alb_delete_via_awsapi" {
  description = "Enable ALB delete via AWS API"
  type        = bool
}

variable "alb_ip_address_type" {
  description = "The IP address type for the ALB"
  type        = string
}

variable "access_log_bucket_name" {
  description = "The bucket name for ALB access logs"
  type        = string
}

variable "enable_access_logs" {
  description = "Enable access logs for the ALB"
  type        = bool
}

variable "target_group_names" {
  description = "The list of target group names"
  type        = list(string)
}

variable "target_ports" {
  description = "The target ports for the target groups"
  type        = map(number)
}

variable "target_protocol" {
  description = "The target protocol for the target groups"
  type        = string
}

variable "deregistration_delay" {
  description = "The deregistration delay for the target groups"
  type        = number
}

variable "slow_start" {
  description = "The slow start duration for the target groups"
  type        = number
}

variable "load_balancing_algorithm_type" {
  description = "The load balancing algorithm type for the target groups"
  type        = string
}

variable "target_type" {
  description = "The target type for the target groups"
  type        = string
}

variable "sticky_type" {
  description = "The sticky session type for the target groups"
  type        = string
}

variable "sticky_cookie_duration" {
  description = "The sticky cookie duration for the target groups"
  type        = number
}

variable "sticky_enabled" {
  description = "Enable sticky sessions for the target groups"
  type        = bool
}

variable "health_check_enabled" {
  description = "Enable health checks for the target groups"
  type        = bool
}

variable "health_check_interval" {
  description = "The health check interval for the target groups"
  type        = number
}

variable "health_check_path" {
  description = "The health check path for the target groups"
  type        = string
}

variable "health_check_port" {
  description = "The health check port for the target groups"
  type        = string
}

variable "health_check_protocol" {
  description = "The health check protocol for the target groups"
  type        = string
}

variable "health_check_timeout" {
  description = "The health check timeout for the target groups"
  type        = number
}

variable "healthy_threshold" {
  description = "The healthy threshold for the target groups"
  type        = number
}

variable "unhealthy_threshold" {
  description = "The unhealthy threshold for the target groups"
  type        = number
}

variable "health_check_success_resp_code" {
  description = "The success response code for the health checks"
  type        = string
}

variable "sg_names" {
  description = "The list of security group names"
  type        = list(string)
}

variable "sg_descriptions" {
  description = "The descriptions for the security groups"
  type        = map(string)
}

variable "security_group_descriptions" {
  description = "The detailed descriptions for the security groups"
  type        = map(object({
    ingress_desc             = string
    ingress_fport            = number
    ingress_tport            = number
    ingress_protocol         = string
    ingress_cidr             = string
    ingress_ipv6_cidr        = string
    ingress_prefix_ids       = list(string)
    ingress_security_groups  = list(string)
    egress_desc              = string
    egress_fport             = number
    egress_tport             = number
    egress_protocol          = string
    egress_cidr              = string
    egress_ipv6_cidr         = string
    egress_prefix_ids        = list(string)
    egress_security_groups   = list(string)
  }))
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "db_subnet_group_description" {
  description = "The description of the DB subnet group"
  type        = string
}

variable "db_identifier" {
  description = "The identifier for the DB instance"
  type        = string
}

variable "db_allow_major_version_upgrade" {
  description = "Allow major version upgrade for the DB instance"
  type        = bool
}

variable "db_auto_minor_version_upgrade" {
  description = "Auto minor version upgrade for the DB instance"
  type        = bool
}

variable "db_engine" {
  description = "The engine for the DB instance"
  type        = string
}

variable "db_engine_version" {
  description = "The engine version for the DB instance"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the DB instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage for the DB instance"
  type        = number
}

variable "db_storage_encrypted" {
  description = "Enable storage encryption for the DB instance"
  type        = bool
}

variable "db_parameter_group_name" {
  description = "The parameter group name for the DB instance"
  type        = string
}

variable "db_option_group_name" {
  description = "The option group name for the DB instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The username for the DB instance"
  type        = string
}

variable "db_password" {
  description = "The password for the DB instance"
  type        = string
}

variable "db_port" {
  description = "The port for the DB instance"
  type        = number
}

variable "db_copy_tags_to_snapshot" {
  description = "Copy tags to snapshot"
  type        = bool
}

variable "db_monitoring_interval" {
  description = "The monitoring interval for the DB instance"
  type        = number
}

variable "db_publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
}

variable "db_storage_type" {
  description = "The storage type for the DB instance"
  type        = string
}

variable "db_domain" {
  description = "The domain for the DB instance"
  type        = string
}

variable "db_domain_iam_role_name" {
  description = "The IAM role name for the DB domain"
  type        = string
}

variable "db_multi_az" {
  description = "Enable Multi-AZ for the DB instance"
  type        = bool
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot for the DB instance"
  type        = bool
}

variable "db_vpc_security_group_id" {
  description = "The VPC security group ID for the DB instance"
  type        = list(string)
}

variable "db_backup_retention_period" {
  description = "The backup retention period for the DB instance"
  type        = number
}

variable "db_license_model" {
  description = "The license model for the DB instance"
  type        = string
}

variable "db_apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
}

variable "db_availability_zone" {
  description = "The availability zone for the DB instance"
  type        = string
}

variable "db_backup_window" {
  description = "The backup window for the DB instance"
  type        = string
}

variable "db_ca_cert_identifier" {
  description = "The CA certificate identifier for the DB instance"
  type        = string
}

variable "db_delete_automated_backups" {
  description = "Delete automated backups"
  type        = bool
}

variable "db_deletion_protection" {
  description = "Enable deletion protection for the DB instance"
  type        = bool
}

variable "db_final_snapshot_identifier" {
  description = "The final snapshot identifier for the DB instance"
  type        = string
}

variable "db_iam_database_authentication_enabled" {
  description = "Enable IAM database authentication"
  type        = bool
}

variable "db_iops" {
  description = "The IOPS for the DB instance"
  type        = number
}

variable "db_kms_key_id" {
  description = "The KMS key ID for the DB instance"
  type        = string
}

variable "db_maintenance_window" {
  description = "The maintenance window for the DB instance"
  type        = string
}

variable "db_max_allocated_storage" {
  description = "The maximum allocated storage for the DB instance"
  type        = number
}

variable "db_monitoring_role_arn" {
  description = "The monitoring role ARN for the DB instance"
  type        = string
}

variable "db_replicate_source_db" {
  description = "The source DB instance for replication"
  type        = string
}

variable "db_snapshot_identifier" {
  description = "The snapshot identifier for the DB instance"
  type        = string
}

variable "db_timezone" {
  description = "The timezone for the DB instance"
  type        = string
}

variable "db_timeouts" {
  description = "The timeouts for the DB instance"
  type        = map(string)
}

variable "kms_description" {
  description = "The description of the KMS key"
  type        = string
}

variable "kms_key_usage" {
  description = "The usage of the KMS key"
  type        = string
}

variable "kms_customer_master_key_spec" {
  description = "The customer master key spec for the KMS key"
  type        = string
}

variable "kms_policy" {
  description = "The policy for the KMS key"
  type        = string
}

variable "kms_deletion_window_in_days" {
  description = "The deletion window in days for the KMS key"
  type        = number
}

variable "kms_is_enabled" {
  description = "Whether the KMS key is enabled"
  type        = bool
}

variable "kms_enable_key_rotation" {
  description = "Enable key rotation for the KMS key"
  type        = bool
}
