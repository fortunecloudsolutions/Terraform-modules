vpc_cidr_block = "10.81.0.0/24"
enable_dns_support = true
enable_dns_hostnames = true
instance_tenancy = "default"
env = "production"
division_tag = "your_division"
application_tag = "your_application"
billing_tag = "your_billing"
map_publicip = true
assign_ipv6_address_on_creation = false
availability_zones = ["us-east-1a", "us-east-1b"]
route_cidr_block = "0.0.0.0/0"
internet_gateway_id = "your_igw_id"
bucket_names = ["bucket1", "bucket2"]
s3_acl = "private"
ami_id = "ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"
security_group_ids = ["sg-0123456789abcdef0"]
key_name = "your_key_pair"
alb_names = ["alb1", "alb2"]
alb_internal = false
alb_idle_timeout = 60
enable_alb_delete_via_awsapi = false
alb_ip_address_type = "ipv4"
access_log_bucket_name = "your_access_log_bucket"
enable_access_logs = false
target_group_names = ["tg1", "tg2"]
target_port = {
  tg1 = 80
  tg2 = 8080
}
target_protocol = "HTTP"
deregistration_delay = 300
slow_start = 0
load_balancing_algorithm_type = "round_robin"
target_type = "instance"
sticky_type = "lb_cookie"
sticky_cookie_duration = 86400
sticky_enabled = false
health_check_enabled = true
health_check_interval = 30
health_check_path = "/"
health_check_port = "traffic-port"
health_check_protocol = "HTTP"
health_check_timeout = 5
healthy_threshold = 5
unhealthy_threshold = 2
health_check_success_resp_code = "200"
ingress1_rule_no = 100
ingress1_fport = 0
ingress1_tport = 65535
ingress1_protocol = "tcp"
ingress1_cidr = "0.0.0.0/0"
ingress1_action = "allow"
ingress1_ipv6_cidr = "::/0"
ingress1_icmp_type = -1
ingress1_icmp_code = -1
egress1_rule_no = 100
egress1_fport = 0
egress1_tport = 65535
egress1_protocol = "tcp"
egress1_cidr = "0.0.0.0/0"
egress1_action = "allow"
egress1_ipv6_cidr = "::/0"
egress1_icmp_type = -1
egress1_icmp_code = -1
sg_names = ["sg1", "sg2"]
sg_descriptions = {
  sg1 = "Security group 1"
  sg2 = "Security group 2"
}
security_group_descriptions = {
  sg1 = {
    ingress_desc            = "Ingress for sg1"
    ingress_fport           = 0
    ingress_tport           = 65535
    ingress_protocol        = "tcp"
    ingress_cidr            = "0.0.0.0/0"
    ingress_ipv6_cidr       = "::/0"
    ingress_prefix_ids      = []
    ingress_security_groups = []
    egress_desc             = "Egress for sg1"
    egress_fport            = 0
    egress_tport            = 65535
    egress_protocol         = "tcp"
    egress_cidr             = "0.0.0.0/0"
    egress_ipv6_cidr        = "::/0"
    egress_prefix_ids       = []
    egress_security_groups  = []
  }
  sg2 = {
    ingress_desc            = "Ingress for sg2"
    ingress_fport           = 0
    ingress_tport           = 65535
    ingress_protocol        = "tcp"
    ingress_cidr            = "0.0.0.0/0"
    ingress_ipv6_cidr       = "::/0"
    ingress_prefix_ids      = []
    ingress_security_groups = []
    egress_desc             = "Egress for sg2"
    egress_fport            = 0
    egress_tport            = 65535
    egress_protocol         = "tcp"
    egress_cidr             = "0.0.0.0/0"
    egress_ipv6_cidr        = "::/0"
    egress_prefix_ids       = []
    egress_security_groups  = []
  }
}
db_subnet_group_name = "my-db-subnet-group"
db_subnet_group_description = "My DB Subnet Group"
db_identifier = "mydbinstance"
db_allow_major_version_upgrade = true
db_auto_minor_version_upgrade = true
db_engine = "mysql"
db_engine_version = "5.7"
db_instance_class = "db.t2.micro"
db_allocated_storage = 20
db_storage_encrypted = true
db_parameter_group_name = "default.mysql5.7"
db_option_group_name = "default:mysql-5-7"
db_name = "mydatabase"
db_username = "admin"
db_password = "mypassword"
db_port = 3306
db_copy_tags_to_snapshot = true
db_monitoring_interval = 60
db_publicly_accessible = false
db_storage_type = "gp2"
db_domain = ""
db_domain_iam_role_name = ""
db_multi_az = false
db_skip_final_snapshot = true
db_vpc_security_group_id = "sg-0123456789abcdef0"
db_backup_retention_period = 7
db_license_model = "license-included"
db_apply_immediately = true
db_availability_zone = "us-east-1a"
db_backup_window = "03:00-06:00"
db_ca_cert_identifier = "rds-ca-2019"
db_delete_automated_backups = true
db_deletion_protection = false
db_final_snapshot_identifier = "final-snapshot"
db_iam_database_authentication_enabled = false
db_iops = 1000
db_kms_key_id = "your-kms-key-id"
db_maintenance_window = "sun:05:00-sun:09:00"
db_max_allocated_storage = 100
db_monitoring_role_arn = "arn:aws:iam::123456789012:role/rds-monitoring-role"
db_replicate_source_db = ""
db_snapshot_identifier = ""
db_timezone = "UTC"
db_timeouts = {
  create = "2h"
  delete = "2h"
}
kms_description = "KMS key for RDS"
kms_key_usage = "ENCRYPT_DECRYPT"
kms_customer_master_key_spec = "SYMMETRIC_DEFAULT"
kms_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
EOF
kms_deletion_window_in_days = 30
kms_is_enabled = true
kms_enable_key_rotation = true
