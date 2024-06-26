module "vpc" {
  source = "../aws/modules/network/vpc"
  cidr_vpc = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy = var.instance_tenancy
  tags = {
    Name       = "ctc-vis-${var.env}-vpc"
    Division   = var.division_tag
    Application = var.application_tag
    Billing    = var.billing_tag
  }
}

module "subnets_az_a" {
  source = "../aws/modules/network/subnet"
  for_each = { for idx, cidr in var.private_subnet_a : idx => cidr }
  vpc_id = module.vpc.vpc_id
  cidr_subnet = each.value
  map_publicip = var.map_publicip
  availability_zone = element(var.availability_zones, 0)
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags = {
    Name        = "ctc-vis-${var.env}-${each.key}-a"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "subnets_az_b" {
  source = "../aws/modules/network/subnet"
  for_each = { for idx, cidr in var.private_subnet_b : idx => cidr }
  vpc_id = module.vpc.vpc_id
  cidr_subnet = each.value
  map_publicip = var.map_publicip
  availability_zone = element(var.availability_zones, 1)
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags = {
    Name        = "ctc-vis-${var.env}-${each.key}-b"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "route_table" {
  source = "../aws/modules/network/route-table"
  vpc_id = module.vpc.vpc_id
  route = {
    destination_cidr_block = var.route_destination_cidr_block
  }
  tags = {
    Name        = "ctc-vis-${var.env}-route-table"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

resource "aws_route_table_association" "subnet_association" {
  for_each = merge(module.subnets_az_a, module.subnets_az_b)
  subnet_id = each.value.subnet_id
  route_table_id = module.route_table.id
}

module "vpc_endpoints" {
  source = "../aws/modules/network/vpc-endpoint"
  for_each = toset(["dynamodb", "s3"])
  vpc_id = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.aws_region}.${each.key}"
  vpc_endpoint_type = "Gateway"
  tags = {
    Name        = "ctc-vis-${var.env}-vpc-${each.key}-endpoint"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "s3_buckets" {
  source = "../aws/modules/volumes/s3/s3-create-bucket"
  for_each = toset(var.bucket_names)
  bucket = each.value
  acl = var.s3_acl
  tags = {
    Name        = "ctc-vis-${var.env}-${each.value}"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "iam_role" {
  source = "../aws/modules/iam/iam-role"
  name = "ec2-role-${var.env}"
  role_policy = data.aws_iam_policy_document.assume_role_policy.json
  force_detach_policies = false
  path = "/"
  max_session_duration = 3600
  tags = {
    Name        = "ctc-vis-${var.env}-iam-role"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

module "iam_policy" {
  source = "../aws/modules/iam/iam-role-policy"
  iam_role = module.iam_role.role_name
  iam_policy = data.aws_iam_policy_document.ec2_policy.json
}

data "aws_iam_policy_document" "ec2_policy" {
  statement {
    actions = [
      "s3:*",
      "ec2:*"
    ]
    resources = ["*"]
  }
}

module "app_ec2" {
  source = "../aws/modules/ec2/ec2-instance"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.subnets_az_a["app"].subnet_id
  vpc_security_group_ids = var.security_group_ids["app"]
  key_name = var.key_name
  availability_zone = element(var.availability_zones, 0)
  iam_instance_profile = {
    name = module.iam_role.role_name
  }
  root_block_device = [{
    volume_type = "gp3"
    volume_size = 100
    delete_on_termination = true
    encrypted = true
    kms_key_id = module.kms_key.kms_key_id
  }]
  ebs_block_device = []
  ephemeral_block_device = []
  associate_public_ip_address = false
  tags = {
    Name        = "ctc-vis-${var.env}-ec2-instance-app"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "web_ec2" {
  source = "../aws/modules/ec2/ec2-instance"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.subnets_az_a["web"].subnet_id
  vpc_security_group_ids = var.security_group_ids["web"]
  key_name = var.key_name
  availability_zone = element(var.availability_zones, 0)
  iam_instance_profile = {
    name = module.iam_role.role_name
  }
  root_block_device = [{
    volume_type = "gp3"
    volume_size = 100
    delete_on_termination = true
    encrypted = true
    kms_key_id = module.kms_key.kms_key_id
  }]
  ebs_block_device = []
  ephemeral_block_device = []
  associate_public_ip_address = false
  tags = {
    Name        = "ctc-vis-${var.env}-ec2-instance-web"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "db_ec2" {
  source = "../aws/modules/ec2/ec2-instance"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.subnets_az_a["db"].subnet_id
  vpc_security_group_ids = var.security_group_ids["db"]
  key_name = var.key_name
  availability_zone = element(var.availability_zones, 0)
  iam_instance_profile = {
    name = module.iam_role.role_name
  }
  root_block_device = [{
    volume_type = "gp3"
    volume_size = 60
    delete_on_termination = true
    encrypted = true
    kms_key_id = module.kms_key.kms_key_id
  }]
  ebs_block_device = [{
    device_name = "/dev/sdf"
    volume_type = "gp3"
    volume_size = 1000
    delete_on_termination = true
    encrypted = true
    kms_key_id = module.kms_key.kms_key_id
  }]
  ephemeral_block_device = []
  associate_public_ip_address = false
  tags = {
    Name        = "ctc-vis-${var.env}-ec2-instance-db"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "app_load_balancer" {
  source = "../aws/modules/load-balancer/app-load-balancer"
  alb_name = "ctc-vis-${var.env}-app-alb"
  alb_internal = var.alb_internal
  security_group_ids = var.alb_security_group_ids["app-alb"]
  idle_timeout = var.alb_idle_timeout
  enable_alb_delete_via_awsapi = var.enable_alb_delete_via_awsapi
  ip_address_type = var.alb_ip_address_type
  attach_alb_subnet_ids = concat(module.subnets_az_a[*].subnet_id, module.subnets_az_b[*].subnet_id)
  access_log_bucket_name = var.access_log_bucket_name
  enable_access_logs = var.enable_access_logs
  tags = {
    Name        = "ctc-vis-${var.env}-app-alb"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "web_load_balancer" {
  source = "../aws/modules/load-balancer/app-load-balancer"
  alb_name = "ctc-vis-${var.env}-web-alb"
  alb_internal = var.alb_internal
  security_group_ids = var.alb_security_group_ids["web-alb"]
  idle_timeout = var.alb_idle_timeout
  enable_alb_delete_via_awsapi = var.enable_alb_delete_via_awsapi
  ip_address_type = var.alb_ip_address_type
  attach_alb_subnet_ids = concat(module.subnets_az_a[*].subnet_id, module.subnets_az_b[*].subnet_id)
  access_log_bucket_name = var.access_log_bucket_name
  enable_access_logs = var.enable_access_logs
  tags = {
    Name        = "ctc-vis-${var.env}-web-alb"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "db_load_balancer" {
  source = "../aws/modules/load-balancer/app-load-balancer"
  alb_name = "ctc-vis-${var.env}-db-alb"
  alb_internal = var.alb_internal
  security_group_ids = var.alb_security_group_ids["db-alb"]
  idle_timeout = var.alb_idle_timeout
  enable_alb_delete_via_awsapi = var.enable_alb_delete_via_awsapi
  ip_address_type = var.alb_ip_address_type
  attach_alb_subnet_ids = concat(module.subnets_az_a[*].subnet_id, module.subnets_az_b[*].subnet_id)
  access_log_bucket_name = var.access_log_bucket_name
  enable_access_logs = var.enable_access_logs
  tags = {
    Name        = "ctc-vis-${var.env}-db-alb"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "target_groups" {
  source = "../aws/modules/load-balancer/target-group-alb"
  for_each = { for idx, tg in var.target_group_names : tg => tg }
  target_group_name = each.value
  target_port = var.target_ports[each.value]
  target_protocol = var.target_protocol
  target_vpc_id = module.vpc.vpc_id
  deregistration_delay = var.deregistration_delay
  slow_start = var.slow_start
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
  target_type = var.target_type
  sticky_type = var.sticky_type
  sticky_cookie_duration = var.sticky_cookie_duration
  sticky_enabled = var.sticky_enabled
  health_check_enabled = var.health_check_enabled
  health_check_interval = var.health_check_interval
  health_check_path = var.health_check_path
  health_check_port = var.health_check_port
  health_check_protocol = var.health_check_protocol
  health_check_timeout = var.health_check_timeout
  healthy_threshold = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  health_check_success_resp_code = var.health_check_success_resp_code
  tags = {
    Name        = "ctc-vis-${var.env}-${each.value}"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "network_acl" {
  source = "../aws/modules/network/nacl"
  vpc_id = module.vpc.vpc_id
  subnet_ids = concat(module.subnets_az_a[*].subnet_id, module.subnets_az_b[*].subnet_id)
  ingress1_rule_no = var.ingress1_rule_no
  ingress1_fport = var.ingress1_fport
  ingress1_tport = var.ingress1_tport
  ingress1_protocol = var.ingress1_protocol
  ingress1_cidr = var.ingress1_cidr
  ingress1_action = var.ingress1_action
  ingress1_ipv6_cidr = var.ingress1_ipv6_cidr
  ingress1_icmp_type = var.ingress1_icmp_type
  ingress1_icmp_code = var.ingress1_icmp_code
  egress1_rule_no = var.egress1_rule_no
  egress1_fport = var.egress1_fport
  egress1_tport = var.egress1_tport
  egress1_protocol = var.egress1_protocol
  egress1_cidr = var.egress1_cidr
  egress1_action = var.egress1_action
  egress1_ipv6_cidr = var.egress1_ipv6_cidr
  egress1_icmp_type = var.egress1_icmp_type
  egress1_icmp_code = var.egress1_icmp_code
  tags = {
    Name        = "ctc-vis-${var.env}-nacl"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "nacl_rules_ingress" {
  source = "../aws/modules/network/nacl-rule"
  for_each = toset(range(8))
  nacl_id = module.network_acl.nacl_id
  egress_enable = false
  rule_no = each.value * 10 + var.nacl_ingress_rule_base
  fport = var.nacl_ingress_fport
  tport = var.nacl_ingress_tport
  protocol = var.nacl_ingress_protocol
  cidr = var.nacl_ingress_cidr
  action = var.nacl_ingress_action
}

module "nacl_rules_egress" {
  source = "../aws/modules/network/nacl-rule"
  for_each = toset(range(8))
  nacl_id = module.network_acl.nacl_id
  egress_enable = true
  rule_no = each.value * 10 + var.nacl_egress_rule_base
  fport = var.nacl_egress_fport
  tport = var.nacl_egress_tport
  protocol = var.nacl_egress_protocol
  cidr = var.nacl_egress_cidr
  action = var.nacl_egress_action
}

module "security_groups" {
  source = "../aws/modules/network/sg"
  for_each = { for idx, name in var.sg_names : name => name }
  sg_name = each.value
  sg_text = var.sg_descriptions[each.value]
  ingress1_desc = var.security_group_descriptions[each.value].ingress_desc
  ingress1_fport = var.security_group_descriptions[each.value].ingress_fport
  ingress1_tport = var.security_group_descriptions[each.value].ingress_tport
  ingress1_protocol = var.security_group_descriptions[each.value].ingress_protocol
  ingress1_cidr = var.security_group_descriptions[each.value].ingress_cidr
  ingress1_ipv6_cidr = var.security_group_descriptions[each.value].ingress_ipv6_cidr
  ingress1_prefix_ids = var.security_group_descriptions[each.value].ingress_prefix_ids
  ingress1_security_groups = var.security_group_descriptions[each.value].ingress_security_groups
  egress1_desc = var.security_group_descriptions[each.value].egress_desc
  egress1_fport = var.security_group_descriptions[each.value].egress_fport
  egress1_tport = var.security_group_descriptions[each.value].egress_tport
  egress1_protocol = var.security_group_descriptions[each.value].egress_protocol
  egress1_cidr = var.security_group_descriptions[each.value].egress_cidr
  egress1_ipv6_cidr = var.security_group_descriptions[each.value].egress_ipv6_cidr
  egress1_prefix_ids = var.security_group_descriptions[each.value].egress_prefix_ids
  egress1_security_groups = var.security_group_descriptions[each.value].egress_security_groups
  vpc_id = module.vpc.vpc_id
  tags = {
    Name        = "ctc-vis-${var.env}-${each.value}"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "db_subnet_group" {
  source = "../aws/modules/rds/subnet-group"
  name = var.db_subnet_group_name
  description = var.db_subnet_group_description
  subnet_ids = concat(module.subnets_az_a[*].subnet_id, module.subnets_az_b[*].subnet_id)
  tags = {
    Name        = "ctc-vis-${var.env}-db-subnet-group"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "db_instance" {
  source = "../aws/modules/rds/db-instance"
  identifier = var.db_identifier
  allow_major_version_upgrade = var.db_allow_major_version_upgrade
  auto_minor_version_upgrade = var.db_auto_minor_version_upgrade
  engine = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_encrypted = var.db_storage_encrypted
  db_subnet_group_name = module.db_subnet_group.subnet_group_id
  parameter_group_name = var.db_parameter_group_name
  option_group_name = var.db_option_group_name
  name = var.db_name
  username = var.db_username
  password = var.db_password
  port = var.db_port
  copy_tags_to_snapshot = var.db_copy_tags_to_snapshot
  monitoring_interval = var.db_monitoring_interval
  publicly_accessible = var.db_publicly_accessible
  storage_type = var.db_storage_type
  domain = var.db_domain
  domain_iam_role_name = var.db_domain_iam_role_name
  multi_az = var.db_multi_az
  skip_final_snapshot = var.db_skip_final_snapshot
  vpc_security_group_ids = [var.db_vpc_security_group_id, module.security_groups["App-Prod-SG"].sg_id]
  backup_retention_period = var.db_backup_retention_period
  license_model = var.db_license_model
  tags = {
    Name        = "ctc-vis-${var.env}-db-instance"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
  apply_immediately = var.db_apply_immediately
  availability_zone = var.db_availability_zone
  backup_window = var.db_backup_window
  ca_cert_identifier = var.db_ca_cert_identifier
  delete_automated_backups = var.db_delete_automated_backups
  deletion_protection = var.db_deletion_protection
  final_snapshot_identifier = var.db_final_snapshot_identifier
  iam_database_authentication_enabled = var.db_iam_database_authentication_enabled
  iops = var.db_iops
  kms_key_id = module.kms_key.kms_key_id
  maintenance_window = var.db_maintenance_window
  max_allocated_storage = var.db_max_allocated_storage
  monitoring_role_arn = var.db_monitoring_role_arn
  replicate_source_db = var.db_replicate_source_db
  snapshot_identifier = var.db_snapshot_identifier
  timezone = var.db_timezone
  timeouts = var.db_timeouts
}

module "kms_key" {
  source = "../aws/modules/kms-key"
  description = var.kms_description
  key_usage = var.kms_key_usage
  customer_master_key_spec = var.kms_customer_master_key_spec
  policy = var.kms_policy
  deletion_window_in_days = var.kms_deletion_window_in_days
  is_enabled = var.kms_is_enabled
  enable_key_rotation = var.kms_enable_key_rotation
  tags = {
    Name        = "ctc-vis-${var.env}-kms-key"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "web_sg" {
  source = "../aws/modules/network/sg"
  sg_name = "web-dev-sg"
  sg_text = "Security group for web-dev"
  ingress1_desc = "Allow HTTP inbound"
  ingress1_fport = 80
  ingress1_tport = 80
  ingress1_protocol = "tcp"
  ingress1_cidr = "0.0.0.0/0"
  egress1_desc = "Allow all outbound traffic"
  egress1_fport = 0
  egress1_tport = 65535
  egress1_protocol = "tcp"
  egress1_cidr = "0.0.0.0/0"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name        = "ctc-vis-${var.env}-web-sg"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

module "app_sg" {
  source = "../aws/modules/network/sg"
  sg_name = "app-dev-sg"
  sg_text = "Security group for app-dev"
  ingress1_desc = "Allow HTTP inbound"
  ingress1_fport = 80
  ingress1_tport = 80
  ingress1_protocol = "tcp"
  ingress1_cidr = "0.0.0.0/0"
  egress1_desc = "Allow all outbound traffic"
  egress1_fport = 0
  egress1_tport = 65535
  egress1_protocol = "tcp"
  egress1_cidr = "0.0.0.0/0"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name        = "ctc-vis-${var.env}-app-sg"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

resource "aws_lb_listener_rule" "app_rule" {
  for_each = toset(var.app_target_groups)
  listener_arn = module.app_load_balancer.alb_listener_arn
  priority = each.value.priority
  action {
    type = "forward"
    target_group_arn = module.target_groups[each.value.name].target_arn
  }
  condition {
    field = "path-pattern"
    values = ["/app${each.value.index}/*"]
  }
}

resource "aws_lb_listener_rule" "web_rule" {
  listener_arn = module.web_load_balancer.alb_listener_arn
  priority = 1
  action {
    type = "forward"
    target_group_arn = module.target_groups["ctc-vis-development-web-TG"].target_arn
  }
  condition {
    field = "path-pattern"
    values = ["/web/*"]
  }
}

resource "aws_lb_listener_rule" "db_rule" {
  listener_arn = module.db_load_balancer.alb_listener_arn
  priority = 2
  action {
    type = "forward"
    target_group_arn = module.target_groups["ctc-vis-development-db-TG"].target_arn
  }
  condition {
    field = "path-pattern"
    values = ["/db/*"]
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  for_each = var.environments
  subnet_ids         = [module.subnets_az_a[each.value].subnet_id, module.subnets_az_b[each.value].subnet_id]
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = module.vpc.vpc_id

  tags = {
    Name        = "ctc-vis-${each.value}-tgw-attachment"
    Environment = each.value
  }
}

resource "aws_ec2_transit_gateway" "this" {
  description = "CTC Transit Gateway"
  dns_support = "enable"
  vpn_ecmp_support = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments = "disable"
  multicast_support = "disable"
  tags = {
    Name        = "ctc-vis-${var.env}-transit-gateway"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

resource "aws_ram_resource_share" "this" {
  name = "CTC Transit Gateway Share"
  allow_external_principals = true
  tags = {
    Name        = "ctc-vis-${var.env}-ram"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

resource "aws_ram_principal_association" "this" {
  principal = var.ram_principal
  resource_share_arn = aws_ram_resource_share.this.arn
}

resource "aws_ram_resource_association" "this" {
  resource_arn = aws_ec2_transit_gateway.this.arn
  resource_share_arn = aws_ram_resource_share.this.arn
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name        = "ctc-vis-${var.env}-internet-gateway"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

# Route to Internet Gateway
resource "aws_route" "internet_access" {
  route_table_id         = module.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

# Route 53 Hosted Zone
resource "aws_route53_zone" "main" {
  name = var.hosted_zone_name
  comment = "Hosted zone for CTC VIS environment"

  tags = {
    Name        = "ctc-vis-${var.env}-route53"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

# Storage Gateway
resource "aws_storagegateway_gateway" "this" {
  gateway_name = var.storage_gateway_name
  gateway_type = "FILE_S3"
  gateway_timezone = "GMT"
  gateway_region = var.aws_region
  tags = {
    Name        = var.storage_gateway_name
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

resource "aws_storagegateway_smb_file_share" "this" {
  gateway_arn = aws_storagegateway_gateway.this.arn
  location_arn = aws_s3_bucket.ctc_vis_production_s3_documents.arn
  role_arn = aws_iam_role.storage_gateway_role.arn
  default_storage_class = "S3_STANDARD"
  object_acl = "private"
  guess_mime_type_enabled = true
  authentication = "GuestAccess"
  access_based_enumeration = false
  valid_user_list = ["*"]
  invalid_user_list = []
  audit_destination_arn = aws_s3_bucket.ctc_vis_accesslog_s3_bucket.arn
  case_sensitivity = "CaseSensitive"
  requester_pays = false
  oplocks_enabled = true
  kms_encrypted = false
  tags = {
    Name        = "ctc-vis-${var.env}-smb-file-share"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = aws_s3_bucket.ctc_vis_production_s3_documents.bucket_regional_domain_name
    origin_id   = "S3-ctc-vis-production-s3-documents"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id       = "S3-ctc-vis-production-s3-documents"
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CTC VIS CloudFront Distribution"
  default_root_object = "index.html"

  tags = {
    Name        = "ctc-vis-${var.env}-cloudfront"
    Division    = var.division_tag
    Application = var.application_tag
    Billing     = var.billing_tag
  }
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "OAI for CTC VIS CloudFront Distribution"
}
