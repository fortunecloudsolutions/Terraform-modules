aws_production_access_key_id       = "YOUR_AWS_PRODUCTION_ACCESS_KEY_ID"
aws_production_secret_access_key   = "YOUR_AWS_PRODUCTION_SECRET_ACCESS_KEY"
ami_id                             = "ami-0c55b159cbfafe1f0" # Replace with actual AMI ID
aws_region                         = "us-west-2"

vpc_cidr_blocks = {
  production = "10.3.0.0/16"
}

availability_zones = ["us-west-2a", "us-west-2b"]

bucket_names = ["bucket1", "bucket2", "bucket3", "bucket4", "bucket5", "bucket6", "bucket7"]

alb_names = ["Prod-App-A-Alb", "Prod-Web-A-Alb", "Prod-Esb-A-Alb"]

target_group_names = ["tg1", "tg2", "tg3", "tg4", "tg5", "tg6", "tg7", "tg8", "tg9", "tg10", "tg11", "tg12"]

sg_names = ["Esb-Prod-SG", "Web-Prod-SG", "App-Prod-SG"]

sg_descriptions = ["ESB Production Security Group", "Web Production Security Group", "App Production Security Group"]

ingress_ports = [80, 80, 80]

egress_ports = [65535, 65535, 65535]

security_group_descriptions = {
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

enable_dns_support = true
enable_dns_hostnames = true
instance_tenancy = "default"
vpc_name = "Production-VPC"
map_publicip = false
assign_ipv6_address_on_creation = false
internet_gateway_id = "igw-xxxxxxxx" # Replace with actual Internet Gateway ID
route_table_name = "central"
route_cidr_block = "0.0.0.0/0"
vpc_endpoints = ["s3", "dynamodb", "sns"]
vpc_endpoint_type = "Gateway"
s3_acl = "private"
instance_type = "m6i.large"
security_group_ids = ["sg-12345678"] # Replace with actual security group IDs
key_name = "your-key-name" # Replace with your key name
alb_internal = false
alb_idle_timeout = 60
enable_alb_delete_via_awsapi = false
alb_ip_address_type = "ipv4"
access_log_bucket_name = "my-access-logs-bucket"
enable_access_logs = true
target_port = 80
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
ingress1_fport = 0
ingress1_tport = 65535
ingress1_protocol = "tcp"
ingress1_cidr = "0.0.0.0/0"
ingress1_action = "allow"
ingress1_ipv6_cidr = null
ingress1_icmp_type = 0
ingress1_icmp_code = 0
egress1_rule_no = 100
egress1_fport = 0
egress1_tport = 65535
egress1_protocol = "tcp"
egress1_cidr = "0.0.0.0/0"
egress1_action = "allow"
egress1_ipv6_cidr = null
egress1_icmp_type = 0
egress1_icmp_code = 0
network_acl_name = "Production-NACL"
nacl_ingress_rule_base = 100
nacl_ingress_fport = 0
nacl_ingress_tport = 65535
nacl_ingress_protocol = "tcp"
nacl_ingress_cidr = "0.0.0.0/0"
nacl_ingress_action = "allow"
nacl_egress_rule_base = 100
nacl_egress_fport = 0
nacl_egress_tport = 65535
nacl_egress_protocol = "tcp"
nacl_egress_cidr = "0.0.0.0/0"
nacl_egress_action = "allow"
