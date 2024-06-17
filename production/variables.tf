variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.81.0.0/24"
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "The instance tenancy attribute for the VPC."
  type        = string
  default     = "default"
}

variable "env" {
  description = "The environment name."
  type        = string
  default     = "production"
}

variable "division_tag" {
  description = "The division tag."
  type        = string
}

variable "application_tag" {
  description = "The application tag."
  type        = string
}

variable "billing_tag" {
  description = "The billing tag."
  type        = string
}

variable "map_publicip" {
  description = "Assign a public IP address to an instance launched in a VPC."
  type        = bool
  default     = true
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on creation."
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "List of availability zones."
  type        = list(string)
}

variable "route_cidr_block" {
  description = "The CIDR block for the route."
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the internet gateway."
  type        = string
}

variable "bucket_names" {
  description = "List of S3 bucket names."
  type        = list(string)
}

variable "s3_acl" {
  description = "The ACL to apply to the S3 buckets."
  type        = string
  default     = "private"
}

variable "ami_id" {
  description = "The AMI ID to use for the instances."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name to use for the instances."
  type        = string
}

variable "alb_names" {
  description = "A list of ALB names."
  type        = list(string)
}

variable "alb_internal" {
  description = "Boolean to determine if the ALB is internal."
  type        = bool
  default     = false
}

variable "alb_idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

variable "enable_alb_delete_via_awsapi" {
  description = "Enable ALB deletion via AWS API."
  type        = bool
  default     = false
}

variable "alb_ip_address_type" {
  description = "The type of IP addresses used by the ALB."
  type        = string
  default     = "ipv4"
}

variable "access_log_bucket_name" {
  description = "The name of the S3 bucket for access logs."
  type        = string
}

variable "enable_access_logs" {
  description = "Enable access logging."
  type        = bool
  default     = false
}

variable "target_group_names" {
  description = "A list of target group names."
  type        = list(string)
}

variable "target_ports" {
  description = "Map of target group names to their respective ports."
  type        = map(number)
}

variable "target_protocol" {
  description = "The protocol to use for routing traffic to the targets."
  type        = string
  default     = "HTTP"
}

variable "deregistration_delay" {
  description = "The amount of time for Elastic Load Balancing to wait before deregistering a target."
  type        = number
  default     = 300
}

variable "slow_start" {
  description = "The time period, in seconds, during which the load balancer shifts traffic to a newly registered target."
  type        = number
  default     = 0
}

variable "load_balancing_algorithm_type" {
  description = "The load balancing algorithm type."
  type        = string
  default     = "round_robin"
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with a target group."
  type        = string
  default     = "instance"
}

variable "sticky_type" {
  description = "The type of sticky sessions."
  type        = string
  default     = "lb_cookie"
}

variable "sticky_cookie_duration" {
  description = "The time period, in seconds, during which requests from a client should be routed to the same target."
  type        = number
  default     = 86400
}

variable "sticky_enabled" {
  description = "Enable sticky sessions."
  type        = bool
  default     = false
}

variable "health_check_enabled" {
  description = "Enable health checks."
  type        = bool
  default     = true
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target."
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "The destination for the health check request."
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "The port the load balancer uses when performing health checks on targets."
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "The protocol the load balancer uses when performing health checks on targets."
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check."
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = number
  default     = 5
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy."
  type        = number
  default     = 2
}

variable "health_check_success_resp_code" {
  description = "The HTTP codes to use when checking for a successful response from a target."
  type        = string
  default     = "200"
}

variable "ingress1_rule_no" {
  description = "The rule number for the ingress rule."
  type        = number
  default     = 100
}

variable "ingress1_fport" {
  description = "The from port for the ingress rule."
  type        = number
  default     = 0
}

variable "ingress1_tport" {
  description = "The to port for the ingress rule."
  type        = number
  default     = 65535
}

variable "ingress1_protocol" {
  description = "The protocol for the ingress rule."
  type        = string
  default     = "tcp"
}

variable "ingress1_cidr" {
  description = "The CIDR block for the ingress rule."
  type        = string
  default     = "0.0.0.0/0"
}

variable "ingress1_action" {
  description = "The action for the ingress rule."
  type        = string
  default     = "allow"
}

variable "ingress1_ipv6_cidr" {
  description = "The IPv6 CIDR block for the ingress rule."
  type        = string
}

variable "ingress1_icmp_type" {
  description = "The ICMP type for the ingress rule."
  type        = number
  default     = -1
}

variable "ingress1_icmp_code" {
  description = "The ICMP code for the ingress rule."
  type        = number
  default     = -1
}

variable "egress1_rule_no" {
  description = "The rule number for the egress rule."
  type        = number
  default     = 100
}

variable "egress1_fport" {
  description = "The from port for the egress rule."
  type        = number
  default     = 0
}

variable "egress1_tport" {
  description = "The to port for the egress rule."
  type        = number
  default     = 65535
}

variable "egress1_protocol" {
  description = "The protocol for the egress rule."
  type        = string
  default     = "tcp"
}

variable "egress1_cidr" {
  description = "The CIDR block for the egress rule."
  type        = string
  default     = "0.0.0.0/0"
}

variable "egress1_action" {
  description = "The action for the egress rule."
  type        = string
  default     = "allow"
}

variable "egress1_ipv6_cidr" {
  description = "The IPv6 CIDR block for the egress rule."
  type        = string
}

variable "egress1_icmp_type" {
  description = "The ICMP type for the egress rule."
  type        = number
  default     = -1
}

variable "egress1_icmp_code" {
  description = "The ICMP code for the egress rule."
  type        = number
  default     = -1
}

variable "sg_names" {
  description = "A list of security group names."
  type        = list(string)
}

variable "sg_descriptions" {
  description = "A map of security group descriptions."
  type        = map(string)
}

variable "security_group_descriptions" {
  description = "A map of security group descriptions."
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

variable "instance_security_group_ids" {
  description = "Map of instance types to their respective security group IDs."
  type        = map(list(string))
}

variable "alb_security_group_ids" {
  description = "Map of ALB names to their respective security group IDs."
  type        = map(list(string))
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
  type        = string
}

variable "db_subnet_group_description" {
  description = "The description of the DB subnet group."
  type        = string
}

variable "db_identifier" {
  description = "The identifier for the RDS instance."
  type        = string
}

variable "db_allow_major_version_upgrade" {
  description = "Allow major version upgrade."
  type        = bool
}

variable "db_auto_minor_version_upgrade" {
  description = "Allow auto minor version upgrade."
  type        = bool
}

variable "db_engine" {
  description = "The database engine to use."
  type        = string
}

variable "db_engine_version" {
  description = "The engine version to use."
  type        = string
}

variable "db_instance_class" {
  description = "The instance class to use."
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes."
  type        = number
}

variable "db_storage_encrypted" {
  description = "Enable storage encryption."
  type        = bool
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group."
  type        = string
}

variable "db_option_group_name" {
  description = "The name of the DB option group."
  type        = string
}

variable "db_name" {
  description = "The name of the database."
  type        = string
}

variable "db_username" {
  description = "The username for the database."
  type        = string
}

variable "db_password" {
  description = "The password for the database."
  type        = string
}

variable "db_port" {
  description = "The port for the database."
  type        = number
}

variable "db_copy_tags_to_snapshot" {
  description = "Copy tags to snapshot."
  type        = bool
}

variable "db_monitoring_interval" {
  description = "The interval in seconds to collect monitoring metrics."
  type        = number
}

variable "db_publicly_accessible" {
  description = "Enable public access to the database."
  type        = bool
}

variable "db_storage_type" {
  description = "The storage type to use."
  type        = string
}

variable "db_domain" {
  description = "The domain to join the instance to."
  type        = string
}

variable "db_domain_iam_role_name" {
  description = "The IAM role name to use when joining the instance to a domain."
  type        = string
}

variable "db_multi_az" {
  description = "Enable multi-AZ deployment."
  type        = bool
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot before deletion."
  type        = bool
}

variable "db_vpc_security_group_id" {
  description = "The VPC security group ID to assign to the instance."
  type        = string
}

variable "db_backup_retention_period" {
  description = "The number of days to retain backups."
  type        = number
}

variable "db_license_model" {
  description = "The license model to use."
  type        = string
}

variable "db_apply_immediately" {
  description = "Apply changes immediately."
  type        = bool
}

variable "db_availability_zone" {
  description = "The availability zone to deploy the instance in."
  type        = string
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups are created."
  type        = string
}

variable "db_ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance."
  type        = string
}

variable "db_delete_automated_backups" {
  description = "Enable deletion of automated backups."
  type        = bool
}

variable "db_deletion_protection" {
  description = "Enable deletion protection."
  type        = bool
}

variable "db_final_snapshot_identifier" {
  description = "The identifier for the final snapshot."
  type        = string
}

variable "db_iam_database_authentication_enabled" {
  description = "Enable IAM database authentication."
  type        = bool
}

variable "db_iops" {
  description = "The amount of provisioned IOPS."
  type        = number
}

variable "db_kms_key_id" {
  description = "The KMS key identifier."
  type        = string
}

variable "db_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur."
  type        = string
}

variable "db_max_allocated_storage" {
  description = "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance."
  type        = number
}

variable "db_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch."
  type        = string
}

variable "db_replicate_source_db" {
  description = "The identifier of the source DB instance if this is a read replica."
  type        = string
}

variable "db_snapshot_identifier" {
  description = "The identifier for the DB snapshot to restore from."
  type        = string
}

variable "db_timezone" {
  description = "The time zone of the DB instance."
  type        = string
}

variable "db_timeouts" {
  description = "The create, update, and delete timeout values."
  type        = map(string)
}

variable "kms_description" {
  description = "The description of the KMS key."
  type        = string
}

variable "kms_key_usage" {
  description = "The key usage of the KMS key."
  type        = string
}

variable "kms_customer_master_key_spec" {
  description = "The CMK spec for the KMS key."
  type        = string
}

variable "kms_policy" {
  description = "The policy for the KMS key."
  type        = string
}

variable "kms_deletion_window_in_days" {
  description = "The number of days to wait before deleting the KMS key."
  type        = number
}

variable "kms_is_enabled" {
  description = "Enable the KMS key."
  type        = bool
}

variable "kms_enable_key_rotation" {
  description = "Enable key rotation for the KMS key."
  type        = bool
}
