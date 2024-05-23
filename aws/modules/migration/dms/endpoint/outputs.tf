output "endpoint_arn" {
  #{"type":"string","default":"arn:dummy"}
  description = "The Amazon Resource Name (ARN) for the endpoint."
  value       = aws_dms_endpoint.endpoint.endpoint_arn
}