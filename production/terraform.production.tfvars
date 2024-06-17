vpc_cidr_block = "10.81.0.0/16"
enable_dns_support = true
enable_dns_hostnames = true
instance_tenancy = "default"
availability_zones = ["us-west-2a", "us-west-2b"]
map_publicip = false
assign_ipv6_address_on_creation = false

private_subnet_a = ["10.81.3.16/28", "10.81.3.32/28", "10.81.3.48/28", "10.81.3.64/28", "10.81.3.80/28", "10.81.3.96/28"]
private_subnet_b = ["10.81.4.16/28", "10.81.4.32/28", "10.81.4.48/28", "10.81.4.64/28", "10.81.4.80/28", "10.81.4.96/28"]

route_destination_cidr_block = "0.0.0.0/0"
aws_region = "us-west-2"
bucket_names = ["bucket1", "bucket2", "bucket3"]
s3_acl = "private"

ami_id = "ami-0abcdef1234567890"
instance_type = "t2.micro"
key_name = "my-key"
security_group_ids = {
  app = ["sg-0123456789abcdef0"]
  web = ["sg-0123456789abcdef1"]
  db  = ["sg-0123456789abcdef2"]
}

alb_names = ["app-alb", "web-alb", "db-alb"]
alb_internal = false
alb_security_group_ids = {
  "app-alb" = ["sg-0123456789abcdef3"]
  "web-alb" = ["sg-0123456789abcdef4"]
  "db-alb"  = ["sg-0123456789abcdef5"]
}
alb_idle_timeout = 60
enable_alb_delete_via_awsapi = true
alb_ip_address_type = "ipv4"
access_log_bucket_name = "alb-access-logs"
enable_access_logs = true

target_group_names = ["app-target-group", "web-target-group", "db-target-group"]
target_ports = {
  "app-target-group" = 80
  "web-target-group" = 80
  "db-target-group"  = 3306
}
target_protocol = "HTTP"
deregistration_delay = 300
slow_start = 0
load_balancing_algorithm_type = "round_robin"
target_type = "instance"
sticky_type = "lb_cookie"
sticky_cookie_duration = 86400
sticky_enabled = true
health_check_enabled = true
health_check_interval = 30
health_check_path = "/"
health_check_port = "traffic-port"
health_check_protocol = "HTTP"
health_check_timeout = 5
healthy_threshold = 3
unhealthy_threshold = 3
health_check_success_resp_code = "200"

ingress1_rule_no = 100
ingress1_fport = 80
ingress1_tport = 80
ingress1_protocol = "tcp"
ingress1_cidr = "0.0.0.0/0"
ingress1_action = "allow"
ingress1_ipv6_cidr = "::/0"
ingress1_icmp_type = 8
ingress1_icmp_code = 0

egress1_rule_no = 100
egress1_fport = 0
egress1_tport = 65535
egress1_protocol = "tcp"
egress1_cidr = "0.0.0.0/0"
egress1_action = "allow"
egress1_ipv6_cidr = "::/0"
egress1_icmp_type = 0
egress1_icmp_code = 0

sg_names = ["app-sg", "web-sg", "db-sg"]
sg_descriptions = {
  "app-sg" = "Security group for app instances"
  "web-sg" = "Security group for web instances"
  "db-sg"  = "Security group for db instances"
}
security_group_descriptions = {
  "app-sg" = {
    ingress_desc = "Allow HTTP inbound"
    ingress_fport = 80
    ingress_tport = 80
    ingress_protocol = "tcp"
    ingress_cidr = "0.0.0.0/0"
    ingress_ipv6_cidr = "::/0"
    ingress_prefix_ids = []
    ingress_security_groups = []
    egress_desc = "Allow all outbound traffic"
    egress_fport = 0
    egress_tport = 65535
    egress_protocol = "tcp"
    egress_cidr = "0.0.0.0/0"
    egress_ipv6_cidr = "::/0"
    egress_prefix_ids = []
    egress_security_groups = []
  }
  "web-sg" = {
    ingress_desc = "Allow HTTP inbound"
    ingress_fport = 80
    ingress_tport = 80
    ingress_protocol = "tcp"
    ingress_cidr = "0.0.0.0/0"
    ingress_ipv6_cidr = "::/0"
    ingress_prefix_ids = []
    ingress_security_groups = []
    egress_desc = "Allow all outbound traffic"
    egress_fport = 0
    egress_tport = 65535
    egress_protocol = "tcp"
    egress_cidr = "0.0.0.0/0"
    egress_ipv6_cidr = "::/0"
    egress_prefix_ids = []
    egress_security_groups = []
  }
  "db-sg" = {
    ingress_desc = "Allow MySQL inbound"
    ingress_fport = 3306
    ingress_tport = 3306
    ingress_protocol = "tcp"
    ingress_cidr = "0.0.0.0/0"
    ingress_ipv6_cidr = "::/0"
    ingress_prefix_ids = []
    ingress_security_groups = []
    egress_desc = "Allow all outbound traffic"
    egress_fport = 0
    egress_tport = 65535
    egress_protocol = "tcp"
    egress_cidr = "0.0.0.0/0"
    egress_ipv6_cidr = "::/0"
    egress_prefix_ids = []
    egress_security_groups = []
  }
}

db_subnet_group_name = "db-subnet-group"
db_subnet_group_description = "Subnet group for DB instances"
db_identifier = "my-db"
db_allow_major_version_upgrade = true
db_auto_minor_version_upgrade = true
db_engine = "mysql"
db_engine_version = "5.7"
db_instance_class = "db.t2.micro"
db_allocated_storage = 20
db_storage_encrypted = true
db_parameter_group_name = "default.mysql5.7"
db_option_group_name = "default:mysql-5-7"
db_name = "mydb"
db_username = "admin"
db_password = "password"
db_port = 3306
db_copy_tags_to_snapshot = true
db_monitoring_interval = 60
db_publicly_accessible = false
db_storage_type = "gp2"
db_domain = ""
db_domain_iam_role_name = ""
db_multi_az = false
db_skip_final_snapshot = true
db_vpc_security_group_id = "sg-0123456789abcdef6"
db_backup_retention_period = 7
db_license_model = "license-included"
db_apply_immediately = true
db_availability_zone = "us-west-2a"
db_backup_window = "02:00-03:00"
db_ca_cert_identifier = "rds-ca-2019"
db_delete_automated_backups = true
db_deletion_protection = false
db_final_snapshot_identifier = ""
db_iam_database_authentication_enabled = false
db_iops = 1000

kms_description = "KMS key for encryption"
kms_key_usage = "ENCRYPT_DECRYPT"
kms_customer_master_key_spec = "SYMMETRIC_DEFAULT"
kms_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY
kms_deletion_window_in_days = 30
kms_is_enabled = true
kms_enable_key_rotation = true
