provider "aws" {
  alias  = "production"
  region = "us-west-2"
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}

variable "aws_production_access_key_id" {
  description = "AWS Access Key ID for Production Account"
}

variable "aws_production_secret_access_key" {
  description = "AWS Secret Access Key for Production Account"
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

module "vpc_production" {
  source = "./Terraform-modules/aws/modules/network/vpc"
  cidr_vpc = var.vpc_cidr_blocks["production"]
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    Name = "Production-VPC"
  }
}

module "subnets_production_az_a" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(6))
  vpc_id              = module.vpc_production.vpc_id
  cidr_subnet         = cidrsubnet(var.vpc_cidr_blocks["production"], 4, each.key)
  map_publicip        = false
  availability_zone   = "us-west-2a"
  assign_ipv6_address_on_creation = false
  tags                = {
    Name = "Production-subnet-us-west-2a-${each.key}"
  }
}

module "subnets_production_az_b" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(6))
  vpc_id              = module.vpc_production.vpc_id
  cidr_subnet         = cidrsubnet(var.vpc_cidr_blocks["production"], 4, each.key + 6)
  map_publicip        = false
  availability_zone   = "us-west-2b"
  assign_ipv6_address_on_creation = false
  tags                = {
    Name = "Production-subnet-us-west-2b-${each.key}"
  }
}

module "route_table_production" {
  source = "./Terraform-modules/aws/modules/network/route-table"
  vpc_id = module.vpc_production.vpc_id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw_id"  # Replace with actual Internet Gateway ID
  }
  tags = {
    Name = "central"
  }
}

resource "aws_route_table_association" "subnet_association" {
  for_each        = concat(module.subnets_production_az_a, module.subnets_production_az_b)
  subnet_id       = each.value.subnet_id
  route_table_id  = module.route_table_production.id
}

module "vpc_endpoints_production" {
  source = "./Terraform-modules/aws/modules/network/vpc-endpoint"
  for_each = toset(["s3", "dynamodb", "sns"])
  vpc_id = module.vpc_production.vpc_id
  service_name = "com.amazonaws.${var.region}.${each.key}"
  vpc_endpoint_type = "Gateway"
  tags = {
    Name = "Production-VPC-${each.key}-endpoint"
  }
}

module "s3_buckets" {
  source = "./Terraform-modules/aws/modules/volumes/s3/s3-create-bucket"
  for_each = toset(var.bucket_names)
  bucket = each.key
  acl = "private"
  tags = {
    Name = each.key
  }
}

module "ec2_instances" {
  source = "./Terraform-modules/aws/modules/ec2/ec2-instance"
  for_each = toset(range(6))
  ami = var.ami_id
  instance_type = "m6i.large"
  subnet_id = each.value % 2 == 0 ? module.subnets_production_az_a[each.value / 2].subnet_id : module.subnets_production_az_b[each.value / 2].subnet_id
  vpc_security_group_ids = ["sg-12345678"] # Replace with actual security group IDs
  key_name = "your-key-name" # Replace with your key name
  availability_zone = each.value % 2 == 0 ? "us-west-2a" : "us-west-2b"
  tags = {
    Name = "EC2-Instance-${each.value}"
  }
}

module "load_balancers" {
  source = "./Terraform-modules/aws/modules/load-balancer/app-load-balancer"
  for_each = toset(var.alb_names)
  alb_name = each.value
  alb_internal = false
  security_group_ids = ["sg-xxxxxxxx"]
  idle_timeout = 60
  enable_alb_delete_via_awsapi = false
  ip_address_type = "ipv4"
  attach_alb_subnet_ids = concat(module.subnets_production_az_a[*].subnet_id, module.subnets_production_az_b[*].subnet_id)
  access_log_bucket_name = "my-access-logs-bucket"
  enable_access_logs = true
  tags = {
    Name = each.value
  }
}

module "target_groups" {
  source = "./Terraform-modules/aws/modules/load-balancer/target-group-alb"
  for_each = toset(var.target_group_names)
  target_group_name = each.value
  target_port = 80
  target_protocol = "HTTP"
  target_vpc_id = module.vpc_production.vpc_id
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
  tags = {
    Name = each.value
  }
}

module "network_acl" {
  source = "./Terraform-modules/aws/modules/network/nacl"
  vpc_id = module.vpc_production.vpc_id
  subnet_ids = concat(module.subnets_production_az_a[*].subnet_id, module.subnets_production_az_b[*].subnet_id)
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
  tags = {
    Name = "Production-NACL"
  }
}

module "nacl_rules_ingress" {
  source = "./Terraform-modules/aws/modules/network/nacl-rule"
  for_each = toset(range(8))
  nacl_id = module.network_acl.nacl_id
  egress_enable = false
  rule_no = each.value * 10 + 100
  fport = 0
  tport = 65535
  protocol = "tcp"
  cidr = "0.0.0.0/0"
  action = "allow"
}

module "nacl_rules_egress" {
  source = "./Terraform-modules/aws/modules/network/nacl-rule"
  for_each = toset(range(8))
  nacl_id = module.network_acl.nacl_id
  egress_enable = true
  rule_no = each.value * 10 + 100
  fport = 0
  tport = 65535
  protocol = "tcp"
  cidr = "0.0.0.0/0"
  action = "allow"
}

module "security_groups" {
  source = "./Terraform-modules/aws/modules/network/sg"
  for_each = {
    Esb-Prod-SG = {
      sg_name = "Esb-Prod-SG"
      sg_text = "ESB Production Security Group"
      ingress1_desc = "Allow HTTP"
      ingress1_fport = 80
      ingress1_tport = 80
      ingress1_protocol = "tcp"
      ingress1_cidr = ["0.0.0.0/0"]
      ingress1_ipv6_cidr = []
      ingress1_prefix_ids = []
      ingress1_security_groups = []
      egress1_desc = "Allow all outbound traffic"
      egress1_fport = 0
      egress1_tport = 65535
      egress1_protocol = "-1"
      egress1_cidr = ["0.0.0.0/0"]
      egress1_ipv6_cidr = []
      egress1_prefix_ids = []
      egress1_security_groups = []
    }
    Web-Prod-SG = {
      sg_name = "Web-Prod-SG"
      sg_text = "Web Production Security Group"
      ingress1_desc = "Allow HTTP"
      ingress1_fport = 80
      ingress1_tport = 80
      ingress1_protocol = "tcp"
      ingress1_cidr = ["0.0.0.0/0"]
      ingress1_ipv6_cidr = []
      ingress1_prefix_ids = []
      ingress1_security_groups = []
      egress1_desc = "Allow all outbound traffic"
      egress1_fport = 0
      egress1_tport = 65535
      egress1_protocol = "-1"
      egress1_cidr = ["0.0.0.0/0"]
      egress1_ipv6_cidr = []
      egress1_prefix_ids = []
      egress1_security_groups = []
    }
    App-Prod-SG = {
      sg_name = "App-Prod-SG"
      sg_text = "App Production Security Group"
      ingress1_desc = "Allow HTTP"
      ingress1_fport = 80
      ingress1_tport = 80
      ingress1_protocol = "tcp"
      ingress1_cidr = ["0.0.0.0/0"]
      ingress1_ipv6_cidr = []
      ingress1_prefix_ids = []
      ingress1_security_groups = []
      egress1_desc = "Allow all outbound traffic"
      egress1_fport = 0
      egress1_tport = 65535
      egress1_protocol = "-1"
      egress1_cidr = ["0.0.0.0/0"]
      egress1_ipv6_cidr = []
      egress1_prefix_ids = []
      egress1_security_groups = []
    }
  }
  vpc_id = module.vpc_production.vpc_id
}
