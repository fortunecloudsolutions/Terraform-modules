variable "aws_perimeter_access_key_id" {
  description = "AWS Access Key ID for Perimeter Account"
}

variable "aws_perimeter_secret_access_key" {
  description = "AWS Secret Access Key for Perimeter Account"
}

variable "aws_centralhub_access_key_id" {
  description = "AWS Access Key ID for CentralHub Account"
}

variable "aws_centralhub_secret_access_key" {
  description = "AWS Secret Access Key for CentralHub Account"
}

variable "aws_production_access_key_id" {
  description = "AWS Access Key ID for Production Account"
}

variable "aws_production_secret_access_key" {
  description = "AWS Secret Access Key for Production Account"
}

variable "aws_performance_access_key_id" {
  description = "AWS Access Key ID for Performance Account"
}

variable "aws_performance_secret_access_key" {
  description = "AWS Secret Access Key for Performance Account"
}

variable "aws_development_access_key_id" {
  description = "AWS Access Key ID for Development Account"
}

variable "aws_development_secret_access_key" {
  description = "AWS Secret Access Key for Development Account"
}

variable "vpc_cidr_blocks" {
  type = map(map(string))
  default = {
    perimeter = {
      vpc1 = "10.0.0.0/16"
      vpc2 = "10.1.0.0/16"
    }
    centralhub = {
      vpc1 = "10.2.0.0/16"
    }
  }
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
