output "certificate_arn" {
  #{"type":"string","default":"arn:aws:dms:us-east-2:987654321098:certifcate/1A2B3C4D5E6F7G8H9I0J1K2L3M"}
  description = "The Amazon Resource Name (ARN) for the certificate."
  value       = module.certificate.certificate_arn
}