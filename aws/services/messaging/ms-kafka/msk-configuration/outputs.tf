output "arn" {
  #{"type":"string","default":"arn:aws:kafka:us-east-2:111222333444:configuration/SomeTest/abcdabcd-1234-abcd-1234-abcd123e8e8e-1"}
  description = "Amazon Resource Name (ARN) of the configuration."
  value       = module.msk_config.arn
}

output "latest_revision" {
  #{"type":"string","default":"1"}
  description = "Latest revision of the configuration."
  value       = module.msk_config.latest_revision
}