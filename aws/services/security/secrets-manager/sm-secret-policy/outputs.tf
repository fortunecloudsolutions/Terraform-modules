
output "secret_id" {
  #{"type":"string","default":"arn:aws:secretsmanager:us-east-2:987654321098:secret:terraform-20210120201329291400000001-nk4JOQ"}
  description = " Amazon Resource Name (ARN) of the secret."
  value       = module.secret_policy.secret_id
}

