module "vpc_production" {
  source = "./Terraform-modules/aws/modules/network/vpc"
  cidr_vpc = var.vpc_cidr_blocks["production"]
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.vpc_name
  }
}

module "subnets_production_az_a" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(6))
  vpc_id              = module.vpc_production.vpc_id
  cidr_subnet         = cidrsubnet(var.vpc_cidr_blocks["production"], 4, each.key)
  map_publicip        = var.map_publicip
  availability_zone   = element(var.availability_zones, 0)
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags                = {
    Name = "Production-subnet-${element(var.availability_zones, 0)}-${each.key}"
  }
}

module "subnets_production_az_b" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(6))
  vpc_id              = module.vpc_production.vpc_id
  cidr_subnet         = cidrsubnet(var.vpc_cidr_blocks["production"], 4, each.key + 6)
  map_publicip        = var.map_publicip
  availability_zone   = element(var.availability_zones, 1)
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags                = {
    Name = "Production-subnet-${element(var.availability_zones, 1)}-${each.key}"
  }
}

module "route_table_production" {
  source = "./Terraform-modules/aws/modules/network/route-table"
  vpc_id = module.vpc_production.vpc_id
  route = {
    cidr_block = var.route_cidr_block
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "subnet_association" {
  for_each        = concat(module.subnets_production_az_a, module.subnets_production_az_b)
  subnet_id       = each.value.subnet_id
  route_table_id  = module.route_table_production.id
}

module "vpc_endpoints_production" {
  source = "./Terraform-modules/aws/modules/network/vpc-endpoint"
  for_each = toset(var.vpc_endpoints)
  vpc_id = module.vpc_production.vpc_id
  service_name = "com.amazonaws.${var.aws_region}.${each.key}"
  vpc_endpoint_type = var.vpc_endpoint_type
  tags = {
    Name = "Production-VPC-${each.key}-endpoint"
  }
}

module "s3_buckets" {
  source = "./Terraform-modules/aws/modules/volumes/s3/s3-create-bucket"
  for_each = toset(var.bucket_names)
  bucket = each.key
  acl = var.s3_acl
  tags = {
    Name = each.key
  }
}

module "ec2_instances" {
  source = "./Terraform-modules/aws/modules/ec2/ec2-instance"
  for_each = toset(range(6))
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = each.value % 2 == 0 ? module.subnets_production_az_a[each.value / 2].subnet_id : module.subnets_production_az_b[each.value / 2].subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name = var.key_name
  availability_zone = each.value % 2 == 0 ? element(var.availability_zones, 0) : element(var.availability_zones, 1)
  tags = {
    Name = "EC2-Instance-${each.value}"
  }
}

module "load_balancers" {
  source = "./Terraform-modules/aws/modules/load-balancer/app-load-balancer"
  for_each = toset(var.alb_names)
  alb_name = each.value
  alb_internal = var.alb_internal
  security_group_ids = var.security_group_ids
  idle_timeout = var.alb_idle_timeout
  enable_alb_delete_via_awsapi = var.enable_alb_delete_via_awsapi
  ip_address_type = var.alb_ip_address_type
  attach_alb_subnet_ids = concat(module.subnets_production_az_a[*].subnet_id, module.subnets_production_az_b[*].subnet_id)
  access_log_bucket_name = var.access_log_bucket_name
  enable_access_logs = var.enable_access_logs
  tags = {
    Name = each.value
  }
}

module "target_groups" {
  source = "./Terraform-modules/aws/modules/load-balancer/target-group-alb"
  for_each = toset(var.target_group_names)
  target_group_name = each.value
  target_port = var.target_port
  target_protocol = var.target_protocol
  target_vpc_id = module.vpc_production.vpc_id
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
    Name = each.value
  }
}

module "network_acl" {
  source = "./Terraform-modules/aws/modules/network/nacl"
  vpc_id = module.vpc_production.vpc_id
  subnet_ids = concat(module.subnets_production_az_a[*].subnet_id, module.subnets_production_az_b[*].subnet_id)
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
    Name = var.network_acl_name
  }
}

module "nacl_rules_ingress" {
  source = "./Terraform-modules/aws/modules/network/nacl-rule"
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
  source = "./Terraform-modules/aws/modules/network/nacl-rule"
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
  source = "./Terraform-modules/aws/modules/network/sg"
  for_each = toset(var.sg_names)
  sg_name = each.value
  sg_text = var.sg_descriptions[element(index(var.sg_names, each.value), var.sg_descriptions)]
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
  vpc_id = module.vpc_production.vpc_id
}

module "db_subnet_group" {
  source = "./Terraform-modules/aws/modules/rds/subnet-group"
  name = var.db_subnet_group_name
  description = var.db_subnet_group_description
  subnet_ids = concat(module.subnets_production_az_a[*].subnet_id, module.subnets_production_az_b[*].subnet_id)
  tags = {
    Name = var.db_subnet_group_name
  }
}

module "db_instance" {
  source = "./Terraform-modules/aws/modules/rds/db-instance"
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
  tags = var.db_tags
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
  source = "./Terraform-modules/aws/modules/kms-key"
  description = var.kms_description
  key_usage = var.kms_key_usage
  customer_master_key_spec = var.kms_customer_master_key_spec
  policy = var.kms_policy
  deletion_window_in_days = var.kms_deletion_window_in_days
  is_enabled = var.kms_is_enabled
  enable_key_rotation = var.kms_enable_key_rotation
  tags = var.kms_tags
}
