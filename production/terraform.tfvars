aws_production_access_key_id       = "YOUR_AWS_PRODUCTION_ACCESS_KEY_ID"
aws_production_secret_access_key   = "YOUR_AWS_PRODUCTION_SECRET_ACCESS_KEY"
ami_id                             = "ami-0c55b159cbfafe1f0" # Replace with actual AMI ID

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
