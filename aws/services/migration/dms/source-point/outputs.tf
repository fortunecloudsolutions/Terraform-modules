output "source_endpoint_arn" {
  #{"type":"string","default":"arn:aws:dms:us-east-1:123456789012:endpoint:RAAR3R22XSH46S3PWLC3NJAWKM"}
  description = "The Amazon Resource Name (ARN) for the endpoint."
  value       = module.source_endpoint.endpoint_arn
}