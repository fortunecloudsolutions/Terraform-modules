output "arn" {
  #{"type":"string","default":"arn:aws:secretsmanager:us-east-2:987654321098:secret:terraform-20210120201329291400000001-nk4JOQ"}
  description = "The ARN of the secret."
  value       = module.secret_version.arn
}
output "id" {
  #{"type":"string","default":"arn:aws:secretsmanager:us-east-2:987654321098:secret:terraform-20210120201329291400000001-nk4JOQ|7721635F-FE00-4AAA-8482-707877A9D2E8"}
  description = " A pipe delimited combination of secret ID and version ID."
  value       = module.secret_version.id
}
output "version_id" {
  #{"type":"string","default":"7721635F-FE00-4AAA-8482-707877A9D2E8"}
  description = " The unique identifier of the version of the secret."
  value       = module.secret_version.version_id
}
