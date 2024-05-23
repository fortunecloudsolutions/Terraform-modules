provider "aws" {
  alias  = "account_a"
  region = "us-west-2"
  access_key = var.aws_account_a_access_key_id
  secret_key = var.aws_account_a_secret_access_key
}

provider "aws" {
  alias  = "account_b"
  region = "us-west-2"
  access_key = var.aws_account_b_access_key_id
  secret_key = var.aws_account_b_secret_access_key
}
