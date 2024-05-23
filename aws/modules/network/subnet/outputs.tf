output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.subnet_public.id
}

output "subnet_arn" {
  description = "The ARN of the subnet"
  value       = aws_subnet.subnet_public.arn
}
