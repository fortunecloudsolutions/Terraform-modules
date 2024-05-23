output "arn" {
  #{"type":"string","default":"arn:aws:acm:us-east-2:046692759124:certificate/d31025fb-704c-4494-87c5-de7e5db3f306"}
  description = "The ARN of the certificate"
  value       = module.cert.arn
}


output "domain_name" {
  #{"type":"string","default":"dummy"}
  description = "The domain name for which the certificate is issued"
  value       = module.cert.domain_name
}


output "status" {
  #{"type":"string","default":"dummy"}
  description = "Status of the certificate."
  value       = module.cert.status
}


output "validation_emails" {
  #{"type":"string","default":"[]"}
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
  value       = module.cert.validation_emails
}



