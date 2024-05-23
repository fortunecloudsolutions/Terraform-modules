output "arn" {
  #{"type":"string","default":"dummy"}
  description = "The Amazon Resource Name (ARN) of the VPC endpoint."
  value       = module.aws_vpc_endpoint.arn
}

output "id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the VPC endpoint."
  value       = module.aws_vpc_endpoint.id
}

output "cidr_blocks" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the AWS account that owns the route table."
  value       = module.aws_vpc_endpoint.cidr_blocks
}

output "dns_entry" {
  #{"type":"string","default":"dummy"}
  description = "The DNS entries for the VPC Endpoint. Applicable for endpoints of type Interface."
  value       = module.aws_vpc_endpoint.dns_entry
}

output "network_interface_ids" {
  #{"type":"string","default":"dummy"}
  description = "One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface."
  value       = module.aws_vpc_endpoint.network_interface_ids
}

output "owner_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the AWS account that owns the VPC endpoint."
  value       = module.aws_vpc_endpoint.owner_id
}

output "prefix_list_id" {
  #{"type":"string","default":"dummy"}
  description = "The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway."
  value       = module.aws_vpc_endpoint.prefix_list_id
}

output "requester_managed" {
  #{"type":"string","default":"dummy"}
  description = "Whether or not the VPC Endpoint is being managed by its service - true or false."
  value       = module.aws_vpc_endpoint.requester_managed
}

output "state" {
  #{"type":"string","default":"dummy"}
  description = " The state of the VPC endpoint."
  value       = module.aws_vpc_endpoint.state
}

output "tags_all" {
  #{"type":"string","default":"dummy"}
  description = "A map of tags assigned to the resource, including those inherited from the provider."
  value       = module.aws_vpc_endpoint.tags_all
}






