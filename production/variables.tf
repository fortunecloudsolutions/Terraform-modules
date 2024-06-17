variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "The tenancy of instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "map_publicip" {
  description = "Should be true if you want to provision instances with public IP addresses"
  type        = bool
  default     = false
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on subnet creation"
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "private_subnet_a" {
  description = "CIDR blocks for subnets in availability zone A"
  type        = map(string)
}

variable "private_subnet_b" {
  description = "CIDR blocks for subnets in availability zone B"
  type        = map(string)
}

variable "route_destination_cidr_block" {
  description = "Destination CIDR block for the route"
  type        = string
}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
}

variable "s3_acl" {
  description = "ACL policy for S3 buckets"
  type        = string
  default     = "private"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "security_group_ids" {
  description = "Map of security group IDs for each instance"
  type        = map(list(string))
}

variable "key_name" {
  description = "Key name for EC2 instances"
  type        = string
}

variable "alb_names" {
  description = "List of ALB names"
  type        = list(string)
}

variable "alb_internal" {
  description = "Boolean to indicate if ALB should be internal"
  type        = bool
}

variable "alb_security_group_ids" {
  description = "Map of ALB security group IDs"
  type        = map(list(string))
}

variable "alb_idle_timeout" {
  description = "Idle timeout for ALB"
  type        = number
  default     = 60
}

variable "enable_alb_delete_via_awsapi" {
  description = "Enable ALB deletion via AWS API"
  type        = bool
}

variable "alb_ip_address_type" {
  description = "IP address type for ALB"
  type        = string
}

variable "access_log_bucket_name" {
  description = "S3 bucket name for ALB access logs"
  type        = string
}

variable "enable_access_logs" {
  description = "Enable access logs for ALB"
  type        = bool
}

variable "target_group_names" {
  description = "List of target group names"
  type        = list(string)
}

variable "target_ports" {
  description = "Map of target ports for each target group"
  type        = map(number)
}

variable "target_protocol" {
  description = "Protocol for target groups"
  type        = string
  default     = "HTTP"
}

variable "deregistration_delay" {
  description = "Deregistration delay for target groups"
  type        = number
  default     = 300
}

variable "slow_start" {
  description = "Slow start duration for target groups"
  type        = number
  default     = 0
}

variable "load_balancing_algorithm_type" {
  description = "Load balancing algorithm type for target groups"
  type        = string
  default     = "round_robin"
}

variable "target_type" {
  description = "Target type for target groups"
  type        = string
  default     = "instance"
}

variable "sticky_type" {
  description = "Sticky type for target groups"
  type        = string
  default     = "lb_cookie"
}

variable "sticky_cookie_duration" {
  description = "Sticky cookie duration for target groups"
  type        = number
  default     = 86400
}

variable "sticky_enabled" {
  description = "Enable sticky sessions for target groups"
  type        = bool
  default     = false
}

variable "health_check_enabled" {
  description = "Enable health checks for target groups"
  type        = bool
  default     = true
}

variable "health_check_interval" {
  description = "Health check interval for target groups"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "Health check path for target groups"
  type        = string
}

variable "health_check_port" {
  description = "Health check port for target groups"
  type        = number
  default     = 80
}

variable "health_check_protocol" {
  description = "Health check protocol for target groups"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "Health check timeout for target groups"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Healthy threshold for target groups"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Unhealthy threshold for target groups"
  type        = number
  default     = 3
}

variable "health_check_success_resp_code" {
  description = "Health check success response code for target groups"
  type        = string
  default     = "200"
}

variable "sg_names" {
  description = "Map of security group names"
  type        = map(string)
}

variable "sg_descriptions" {
  description = "Map of security group descriptions"
  type        = map(string)
}

variable "security_group_descriptions" {
  description = "Map of security group descriptions"
  type        = map(object({
    ingress_desc            = string
    ingress_fport           = number
    ingress_tport           = number
    ingress_protocol        = string
    ingress_cidr            = string
    ingress_ipv6_cidr       = string
    ingress_prefix_ids      = list(string)
    ingress_security_groups = list(string)
    egress_desc             = string
    egress_fport            = number
    egress_tport            = number
    egress_protocol         = string
    egress_cidr             = string
    egress_ipv6_cidr        = string
    egress_prefix_ids       = list(string)
    egress_security_groups  = list(string)
  }))
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "db_subnet_group_description" {
  description = "Description of the DB subnet group"
  type        = string
}

variable "db_identifier" {
  description = "Identifier for the DB instance"
  type        = string
}

variable "db_allow_major_version_upgrade" {
  description = "Allow major version upgrade for the DB instance"
  type        = bool
}

variable "db_auto_minor_version_upgrade" {
  description = "Allow minor version upgrade for the DB instance"
  type        = bool
}

variable "db_engine" {
  description = "Database engine for the DB instance"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version for the DB instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the DB instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage for the DB instance"
  type        = number
}

variable "db_storage_encrypted" {
  description = "Enable storage encryption for the DB instance"
  type        = bool
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
}

variable "db_port" {
  description = "Port for the DB instance"
  type        = number
}

variable "db_copy_tags_to_snapshot" {
  description = "Copy tags to snapshot for the DB instance"
  type        = bool
}

variable "db_monitoring_interval" {
  description = "Monitoring interval for the DB instance"
  type        = number
}

variable "db_publicly_accessible" {
  description = "Make the DB instance publicly accessible"
  type        = bool
}

variable "db_storage_type" {
  description = "Storage type for the DB instance"
  type        = string
}

variable "db_domain" {
  description = "Domain for the DB instance"
  type        = string
}

variable "db_domain_iam_role_name" {
  description = "IAM role name for the DB instance domain"
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
  description = "VPC security group ID for the DB instance"
  type        = string
}

variable "db_backup_retention_period" {
  description = "Backup retention period for the DB instance"
  type        = number
}

variable "db_license_model" {
  description = "License model for the DB instance"
  type        = string
}

variable "db_apply_immediately" {
  description = "Apply changes immediately for the DB instance"
  type        = bool
}

variable "db_availability_zone" {
  description = "Availability zone for the DB instance"
  type        = string
}

variable "db_backup_window" {
  description = "Backup window for the DB instance"
  type        = string
}

variable "db_ca_cert_identifier" {
  description = "CA certificate identifier for the DB instance"
  type        = string
}

variable "db_delete_automated_backups" {
  description = "Delete automated backups for the DB instance"
  type        = bool
}

variable "db_deletion_protection" {
  description = "Enable deletion protection for the DB instance"
  type        = bool
}

variable "db_final_snapshot_identifier" {
  description = "Final snapshot identifier for the DB instance"
  type        = string
}

variable "db_iam_database_authentication_enabled" {
  description = "Enable IAM database authentication for the DB instance"
  type        = bool
}

variable "db_iops" {
  description = "IOPS for the DB instance"
  type        = number
}

variable "kms_description" {
  description = "Description for the KMS key"
  type        = string
}

variable "kms_key_usage" {
  description = "Key usage for the KMS key"
  type        = string
}

variable "kms_customer_master_key_spec" {
  description = "Customer master key spec for the KMS key"
  type        = string
}

variable "kms_policy" {
  description = "Policy for the KMS key"
  type        = string
}

variable "kms_deletion_window_in_days" {
  description = "Deletion window in days for the KMS key"
  type        = number
}

variable "kms_is_enabled" {
  description = "Enable the KMS key"
  type        = bool
}

variable "kms_enable_key_rotation" {
  description = "Enable key rotation for the KMS key"
  type        = bool
}
