variable "env" {
  description = "The environment name"
  type        = string
}

variable "aws_production_access_key_id" {
  description = "AWS Access Key ID for Production Account"
}

variable "aws_production_secret_access_key" {
  description = "AWS Secret Access Key for Production Account"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_blocks" {
  type = map(string)
  default = {
    production = "10.3.0.0/16"
  }
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
  default     = ["bucket1", "bucket2", "bucket3", "bucket4", "bucket5", "bucket6", "bucket7"]
}

variable "ami_id" {
  description = "AMI ID for the Windows EC2 instances"
  type        = string
  default     = "" # Replace with actual AMI ID
}

variable "alb_names" {
  description = "List of ALB names"
  type        = list(string)
  default     = ["Prod-App-A-Alb", "Prod-Web-A-Alb", "Prod-Esb-A-Alb"]
}

variable "target_group_names" {
  description = "List of Target Group names"
  type        = list(string)
  default     = ["tg1", "tg2", "tg3", "tg4", "tg5", "tg6", "tg7", "tg8", "tg9", "tg10", "tg11", "tg12"]
}

variable "sg_names" {
  description = "List of Security Group names"
  type        = list(string)
  default     = ["Esb-Prod-SG", "Web-Prod-SG", "App-Prod-SG"]
}

variable "sg_descriptions" {
  description = "Descriptions of Security Groups"
  type        = list(string)
  default     = ["ESB Production Security Group", "Web Production Security Group", "App Production Security Group"]
}

variable "ingress_ports" {
  description = "Ingress ports for Security Groups"
  type        = list(number)
  default     = [80, 80, 80]
}

variable "egress_ports" {
  description = "Egress ports for Security Groups"
  type        = list(number)
  default     = [65535, 65535, 65535]
}

variable "security_group_descriptions" {
  description = "Descriptions for the Security Groups"
  type        = map(any)
  default = {
    "Esb-Prod-SG" = {
      ingress_desc = "Allow HTTP"
      ingress_fport = 80
      ingress_tport = 80
      ingress_protocol = "tcp"
      ingress_cidr = ["0.0.0.0/0"]
      ingress_ipv6_cidr = []
      ingress_prefix_ids = []
      ingress_security_groups = []
      egress_desc = "Allow all outbound traffic"
      egress_fport = 0
      egress_tport = 65535
      egress_protocol = "-1"
      egress_cidr = ["0.0.0.0/0"]
      egress_ipv6_cidr = []
      egress_prefix_ids = []
      egress_security_groups = []
    }
    "Web-Prod-SG" = {
      ingress_desc = "Allow HTTP"
      ingress_fport = 80
      ingress_tport = 80
      ingress_protocol = "tcp"
      ingress_cidr = ["0.0.0.0/0"]
      ingress_ipv6_cidr = []
      ingress_prefix_ids = []
      ingress_security_groups = []
      egress_desc = "Allow all outbound traffic"
      egress_fport = 0
      egress_tport = 65535
      egress_protocol = "-1"
      egress_cidr = ["0.0.0.0/0"]
      egress_ipv6_cidr = []
      egress_prefix_ids = []
      egress_security_groups = []
    }
    "App-Prod-SG" = {
      ingress_desc = "Allow HTTP"
      ingress_fport = 80
      ingress_tport = 80
      ingress_protocol = "tcp"
      ingress_cidr = ["0.0.0.0/0"]
      ingress_ipv6_cidr = []
      ingress_prefix_ids = []
      ingress_security_groups = []
      egress_desc = "Allow all outbound traffic"
      egress_fport = 0
      egress_tport = 65535
      egress_protocol = "-1"
      egress_cidr = ["0.0.0.0/0"]
      egress_ipv6_cidr = []
      egress_prefix_ids = []
      egress_security_groups = []
    }
  }
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
  default     = "default"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "map_publicip" {
  description = "Map public IP on launch"
  type        = bool
  default     = false
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on creation"
  type        = bool
  default     = false
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}

variable "route_cidr_block" {
  description = "CIDR block for route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_endpoints" {
  description = "List of VPC endpoints"
  type        = list(string)
  default     = ["s3", "dynamodb", "sns"]
}

variable "vpc_endpoint_type" {
  description = "Type of VPC endpoint"
  type        = string
  default     = "Gateway"
}

variable "s3_acl" {
  description = "ACL for S3 bucket"
  type        = string
  default     = "private"
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "m6i.large"
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "Key name for EC2 instances"
  type        = string
}

variable "alb_internal" {
  description = "Boolean to determine if ALB is internal"
  type        = bool
  default     = false
}

variable "alb_idle_timeout" {
  description = "Idle timeout for ALB"
  type        = number
  default     = 60
}

variable "enable_alb_delete_via_awsapi" {
  description = "Boolean to enable ALB deletion via AWS API"
  type        = bool
  default     = false
}

variable "alb_ip_address_type" {
  description = "IP address type for ALB"
  type        = string
  default     = "ipv4"
}

variable "access_log_bucket_name" {
  description = "Bucket name for ALB access logs"
  type        = string
}

variable "enable_access_logs" {
  description = "Boolean to enable ALB access logs"
  type        = bool
  default     = false
}

variable "target_port" {
  description = "Target port for target groups"
  type        = number
  default     = 80
}

variable "target_protocol" {
  description = "Target protocol for target groups"
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
  description = "Load balancing algorithm type"
  type        = string
  default     = "round_robin"
}

variable "target_type" {
  description = "Target type for target groups"
  type        = string
  default     = "instance"
}

variable "sticky_type" {
  description = "Stickiness type for target groups"
  type        = string
  default     = "lb_cookie"
}

variable "sticky_cookie_duration" {
  description = "Stickiness cookie duration"
  type        = number
  default     = 86400
}

variable "sticky_enabled" {
  description = "Boolean to enable stickiness"
  type        = bool
  default     = true
}

variable "health_check_enabled" {
  description = "Boolean to enable health checks"
  type        = bool
  default     = true
}

variable "health_check_interval" {
  description = "Health check interval"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "Health check port"
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "Health check timeout"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Healthy threshold for health checks"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Unhealthy threshold for health checks"
  type        = number
  default     = 3
}

variable "health_check_success_resp_code" {
  description = "Success response code for health checks"
  type        = string
  default     = "200"
}

variable "ingress1_rule_no" {
  description = "Rule number for ingress rule 1"
  type        = number
}

variable "ingress1_fport" {
  description = "From port for ingress rule 1"
  type        = number
}

variable "ingress1_tport" {
  description = "To port for ingress rule 1"
  type        = number
}

variable "ingress1_protocol" {
  description = "Protocol for ingress rule 1"
  type        = string
}

variable "ingress1_cidr" {
  description = "CIDR block for ingress rule 1"
  type        = string
}

variable "ingress1_action" {
  description = "Action for ingress rule 1"
  type        = string
}

variable "ingress1_ipv6_cidr" {
  description = "IPv6 CIDR block for ingress rule 1"
  type        = string
}

variable "ingress1_icmp_type" {
  description = "ICMP type for ingress rule 1"
  type        = number
}

variable "ingress1_icmp_code" {
  description = "ICMP code for ingress rule 1"
  type        = number
}

variable "egress1_rule_no" {
  description = "Rule number for egress rule 1"
  type        = number
}

variable "egress1_fport" {
  description = "From port for egress rule 1"
  type        = number
}

variable "egress1_tport" {
  description = "To port for egress rule 1"
  type        = number
}

variable "egress1_protocol" {
  description = "Protocol for egress rule 1"
  type        = string
}

variable "egress1_cidr" {
  description = "CIDR block for egress rule 1"
  type        = string
}

variable "egress1_action" {
  description = "Action for egress rule 1"
  type        = string
}

variable "egress1_ipv6_cidr" {
  description = "IPv6 CIDR block for egress rule 1"
  type        = string
}

variable "egress1_icmp_type" {
  description = "ICMP type for egress rule 1"
  type        = number
}

variable "egress1_icmp_code" {
  description = "ICMP code for egress rule 1"
  type        = number
}

variable "network_acl_name" {
  description = "Name of the network ACL"
  type        = string
}

variable "nacl_ingress_rule_base" {
  description = "Base number for ingress rule"
  type        = number
}

variable "nacl_ingress_fport" {
  description = "From port for NACL ingress rule"
  type        = number
}

variable "nacl_ingress_tport" {
  description = "To port for NACL ingress rule"
  type        = number
}

variable "nacl_ingress_protocol" {
  description = "Protocol for NACL ingress rule"
  type        = string
}

variable "nacl_ingress_cidr" {
  description = "CIDR block for NACL ingress rule"
  type        = string
}

variable "nacl_ingress_action" {
  description = "Action for NACL ingress rule"
  type        = string
}

variable "nacl_egress_rule_base" {
  description = "Base number for egress rule"
  type        = number
}

variable "nacl_egress_fport" {
  description = "From port for NACL egress rule"
  type        = number
}

variable "nacl_egress_tport" {
  description = "To port for NACL egress rule"
  type        = number
}

variable "nacl_egress_protocol" {
  description = "Protocol for NACL egress rule"
  type        = string
}

variable "nacl_egress_cidr" {
  description = "CIDR block for NACL egress rule"
  type        = string
}

variable "nacl_egress_action" {
  description = "Action for NACL egress rule"
  type        = string
}

variable "vpc_cidr_blocks" {
  description = "CIDR blocks for VPC"
  type        = map(string)
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
}

variable "db_identifier" {
  description = "Identifier for the DB instance"
  type        = string
}

variable "db_allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed"
  type        = bool
  default     = false
}

variable "db_auto_minor_version_upgrade" {
  description = "Indicates that minor version upgrades are allowed"
  type        = bool
  default     = true
}

variable "db_engine" {
  description = "Database engine to use"
  type        = string
}

variable "db_engine_version" {
  description = "Engine version to use"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type of the RDS instance"
  type        = string
  default     = "db.m6i.12xlarge"
}

variable "db_allocated_storage" {
  description = "Allocated storage in gigabytes"
  type        = number
}

variable "db_storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "db_parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
}

variable "db_option_group_name" {
  description = "Name of the DB option group to associate"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = string
}

variable "db_copy_tags_to_snapshot" {
  description = "Copy all Instance tags to snapshots"
  type        = bool
  default     = false
}

variable "db_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected"
  type        = number
}

variable "db_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "db_storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  type        = string
}

variable "db_domain" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in"
  type        = string
}

variable "db_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service"
  type        = string
}

variable "db_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}

variable "db_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = false
}

variable "db_vpc_security_group_id" {
  description = "VPC security group ID to associate with the RDS instance"
  type        = string
}

variable "db_backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
}

variable "db_license_model" {
  description = "License model information for the DB instance"
  type        = string
}

variable "db_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}

variable "db_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "db_availability_zone" {
  description = "The AZ for the RDS instance"
  type        = string
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
}

variable "db_ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance"
  type        = string
}

variable "db_delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = true
}

variable "db_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled"
  type        = bool
  default     = false
}

variable "db_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted"
  type        = string
}

variable "db_iam_database_authentication_enabled" {
  description = "Specifies whether mappings of AWS IAM accounts to database accounts is enabled"
  type        = bool
}

variable "db_iops" {
  description = "The amount of provisioned IOPS"
  type        = number
}

variable "db_maintenance_window" {
  description = "The window to perform maintenance in"
  type        = string
}

variable "db_max_allocated_storage" {
  description = "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance"
  type        = number
}

variable "db_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
}

variable "db_replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database"
  type        = string
}

variable "db_snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot"
  type        = string
}

variable "db_timezone" {
  description = "Time zone of the DB instance"
  type        = string
}

variable "db_timeouts" {
  description = "Timeouts configuration options for the DB instance"
  type = object({
    create = string
    update = string
    delete = string
  })
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group"
  type        = string
}

variable "db_subnet_group_description" {
  description = "Description of DB subnet group"
  type        = string
}

variable "kms_description" {
  description = "The description of the KMS key"
  type        = string
}

variable "kms_key_usage" {
  description = "Specifies the intended use of the key"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "kms_customer_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "kms_policy" {
  description = "A valid policy JSON document"
  type        = string
  default     = null
}

variable "kms_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  type        = number
  default     = 30
}

variable "kms_is_enabled" {
  description = "Specifies whether the key is enabled"
  type        = bool
  default     = true
}

variable "kms_enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "kms_tags" {
  description = "A map of tags to assign to the object"
  type        = map(any)
  default     = {}
}
