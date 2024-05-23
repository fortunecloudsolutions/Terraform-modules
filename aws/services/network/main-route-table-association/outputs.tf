output "id" {
  #{"type":"string","default":"dummy"}
  description = " The ARN of the Flow Log."
  value       = module.aws_main_route_table_association.id
}

output "original_route_table_id" {
  #{"type":"string","default":"dummy"}
  description = " The Flow Log ID."
  value       = module.aws_main_route_table_association.original_route_table_id
}







