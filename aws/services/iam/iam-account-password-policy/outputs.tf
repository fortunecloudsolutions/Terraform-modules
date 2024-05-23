output "expire_passwords" {
  #{"type":"string","default":"dummy"}
  description = " Indicates whether passwords in the account expire. Returns true if max_password_age contains a value greater than 0. Returns false if it is 0 or not present."
  value       = module.aws_iam_account_password_policy.expire_passwords
}

