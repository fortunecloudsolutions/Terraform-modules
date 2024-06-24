env = "development"
aws_region = "us-west-2"
s3_service_tag = "s3"

#Tags
division_tag = "MSCD"
application_tag = "ctc-vis"
billing_tag = "TBD"

#vpc
vpc_cidr_block = "10.81.4.0/24"
enable_dns_support = true
enable_dns_hostnames = true
instance_tenancy = "default"

#subnets
map_publicip = false
assign_ipv6_address_on_creation = false
availability_zones = ["us-west-2a", "us-west-2b"]
private_subnet_a = {
  web            = "10.81.4.16/28"
  app            = "10.81.4.32/28"
  data           = "10.81.4.48/28"
  mgmt           = "10.81.4.64/28"
  maintgwattach  = "10.81.4.80/28"
}
private_subnet_b = {
  web            = "10.81.4.96/28"
  app            = "10.81.4.112/28"
  data           = "10.81.4.128/28"
  mgmt           = "10.81.4.144/28"
  maintgwattach  = "10.81.4.160/28"
}

#routetable
route_cidr_block = "10.81.4.0/24"

#s3bucket
ctc_vis_first_s3_bucket = "ctc-vis-development-s3-documents"
ctc_vis_second_s3_bucket = "ctc-vis-development-s3-quarantine"
ctc_vis_third_s3_bucket = "ctc-vis-development-s3-staging"
ctc_vis_accesslog_s3_bucket = "ctc-vis-development-s3-accesslogs"

#securitygroups
sg_descriptions = {
  "ctc-vis-development-sg-web" = "Web security group"
  "ctc-vis-development-sg-app" = "App security group"
  "ctc-vis-development-sg-db" = "Db security group"
}

web_ingress_desc            = "web_ingress for ctc-vis-development-sg-web"
web_ingress_protocol        = "tcp"
web_ingress_cidr            = ["10.81.4.0/24"]
web_egress_desc             = "web_egress for ctc-vis-development-sg-web"
web_egress_protocol         = "-1"
web_egress_cidr             = ["0.0.0.0/0"]

app_ingress_desc            = "app_ingress for ctc-vis-development-sg-app"
app_ingress_protocol        = "tcp"
app_ingress_cidr            = ["10.81.4.0/24"]
app_egress_desc             = "app_egress for ctc-vis-development-sg-app"
app_egress_protocol         = "-1"
app_egress_cidr             = ["0.0.0.0/0"]

db_ingress_desc            = "db_ingress for ctc-vis-development-sg-db"
db_ingress_protocol        = "tcp"
db_ingress_cidr            = ["10.81.4.0/24"]
db_egress_desc             = "db_egress for ctc-vis-development-sg-db"
db_egress_protocol         = "-1"
db_egress_cidr             = ["0.0.0.0/0"]

kms_description = "KMS key for encrypt and decrypt"
kms_key_usage = "ENCRYPT_DECRYPT"
kms_customer_master_key_spec = "SYMMETRIC_DEFAULT"
kms_policy = <<EOF
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
EOF
kms_deletion_window_in_days = 30
kms_is_enabled = true
kms_enable_key_rotation = true

#EC2
ami_id = "ami-0d98fd1f0c3b1f9a9"
instance_type = "t3.medium"
ebs_device_name = "/dev/sdf"

#Loadbalancer
alb_internal = true
alb_idle_timeout = 1080
enable_alb_delete_via_awsapi = true
alb_ip_address_type = "ipv4"

target_group_names = ["ctc-vis-development-web-TG", "ctc-vis-development-app-TG-60010", "ctc-vis-development-app-TG-60011", "ctc-vis-development-app-TG-60012","ctc-vis-development-app-TG-60013", "ctc-vis-development-app-TG-60014", "ctc-vis-development-app-TG-60016", "ctc-vis-development-app-TG-60020", "ctc-vis-development-app-TG-60022", "ctc-vis-development-app-TG-60023", "ctc-vis-development-app-TG-60025", "ctc-vis-development-esb-TG"]
target_ports = {
  "ctc-vis-development-web-TG" = 80
  "ctc-vis-development-app-TG-60010" = 60010
  "ctc-vis-development-app-TG-60011"  = 60011
  "ctc-vis-development-app-TG-60012" = 60012
  "ctc-vis-development-app-TG-60013"  = 60013
  "ctc-vis-development-app-TG-60014" = 60014
  "ctc-vis-development-app-TG-60016"  = 60016
  "ctc-vis-development-app-TG-60020" = 60020
  "ctc-vis-development-app-TG-60022"  = 60022
  "ctc-vis-development-app-TG-60023" = 60023
  "ctc-vis-development-app-TG-60025"  = 60025
  "ctc-vis-development-esb-TG" = 60014
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
health_check_path = "/index.html"
health_check_port = "traffic-port"
health_check_protocol = "HTTP"
health_check_timeout = 5
healthy_threshold = 5
unhealthy_threshold = 3
health_check_success_resp_code = "200"

app_target_groups = [
  { priority = 10, name = "ctc-vis-development-app-TG-60010", index = 60010 },
  { priority = 11, name = "ctc-vis-development-app-TG-60011", index = 60011 },
  { priority = 12, name = "ctc-vis-development-app-TG-60012", index = 60012 },
  { priority = 13, name = "ctc-vis-development-app-TG-60013", index = 60013 },
  { priority = 14, name = "ctc-vis-development-app-TG-60014", index = 60014 },
  { priority = 16, name = "ctc-vis-development-app-TG-60016", index = 60016 },
  { priority = 20, name = "ctc-vis-development-app-TG-60020", index = 60020 },
  { priority = 22, name = "ctc-vis-development-app-TG-60022", index = 60022 },
  { priority = 23, name = "ctc-vis-development-app-TG-60023", index = 60023 },
  { priority = 25, name = "ctc-vis-development-app-TG-60025", index = 60025 },
]
