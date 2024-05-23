
output "arn" {
  #{"type":"string","default":"dummy"}
  description = " The ARN assigned by AWS for this provider."
  value       = module.aws_iam_openid_connect_provider.arn
}