output "arn" {
  description = "ARN of the AMI."
  value       = aws_ami_copy.example.arn
}

output "id" {
  description = "ID of the created AMI."
  value       = aws_ami_copy.example.id
}

