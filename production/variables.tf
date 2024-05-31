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
