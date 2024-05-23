output "arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the route table."
  value       = module.aws_route_table.id
}


output "id" {
  #{"type":"string","default":"dummy"}
  description = "The id of the route table."
  value       = module.aws_route_table.id
}


output "owner_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the AWS account that owns the route table."
  value       = module.aws_route_table.owner_id
}

output "tags_all" {
  #{"type":"string","default":"dummy"}
  description = "A map of tags assigned to the resource, including those inherited from the provider"
  value       = module.aws_route_table.tags_all
}












