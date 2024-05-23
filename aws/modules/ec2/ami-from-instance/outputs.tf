output "arn" {
  description = "The ARN of the AMI."
  value       = aws_ami_from_instance.ami.arn
}

output "id" {
  description = "The ID of the created AMI."
  value       = aws_ami_from_instance.ami.id
}
