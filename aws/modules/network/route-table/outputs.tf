output "arn" {
  description = "The ARN of the route table."
  value       = aws_route_table.example.id
}


output "id" {
  description = "The id of the route table."
  value       = aws_route_table.example.id
}


output "owner_id" {
  description = "The ID of the AWS account that owns the route table."
  value       = aws_route_table.example.owner_id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider"
  value       = aws_route_table.example.tags_all
}





