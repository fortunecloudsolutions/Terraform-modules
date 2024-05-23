
output "id" {
  #{"type":"string","default":"dummy"}
  description = " The ID of the VPC and Internet Gateway separated by a colon."
  value       = module.aws_internet_gateway_attachment.id
}














