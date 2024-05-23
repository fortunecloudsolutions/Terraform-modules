variable "aws_account_a_access_key_id" {
  description = "AWS Access Key ID for Account A"
}

variable "aws_account_a_secret_access_key" {
  description = "AWS Secret Access Key for Account A"
}

variable "aws_account_b_access_key_id" {
  description = "AWS Access Key ID for Account B"
}

variable "aws_account_b_secret_access_key" {
  description = "AWS Secret Access Key for Account B"
}

variable "vpc_cidr_blocks" {
  type = map(map(string))
  default = {
    account_a = {
      vpc1 = "10.0.0.0/16"
      vpc2 = "10.1.0.0/16"
    }
    account_b = {
      vpc1 = "10.2.0.0/16"
    }
  }
}
