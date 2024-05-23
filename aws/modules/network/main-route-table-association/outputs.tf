output "id" {
  description = " The ARN of the Flow Log."
  value       = aws_main_route_table_association.example.id
}

output "original_route_table_id" {
  description = " The Flow Log ID."
  value       = aws_main_route_table_association.example.original_route_table_id
}







