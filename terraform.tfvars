aws_account_a_access_key_id      = "ACCOUNT_A_ACCESS_KEY_ID"
aws_account_a_secret_access_key  = "ACCOUNT_A_SECRET_ACCESS_KEY"
aws_account_b_access_key_id      = "ACCOUNT_B_ACCESS_KEY_ID"
aws_account_b_secret_access_key  = "ACCOUNT_B_SECRET_ACCESS_KEY"

vpc_cidr_blocks = {
  account_a = {
    vpc1 = "10.0.0.0/16"
    vpc2 = "10.1.0.0/16"
  }
  account_b = {
    vpc1 = "10.2.0.0/16"
  }
}
