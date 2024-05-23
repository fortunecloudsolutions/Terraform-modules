output "id" {
  #{"type":"string","default":"dummy"}
  description = "Access key ID"
  value       = module.aws_iam_acount_alias.id
}

