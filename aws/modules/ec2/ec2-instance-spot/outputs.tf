output "public_instance_ip" {
  description = "The public IP address assigned to the instance, if applicable."
  value       = aws_spot_instance_request.ec2_instance.public_ip
}

output "spot_request_id" {
  description = "The Spot Instance Request ID"
  value       = aws_spot_instance_request.ec2_instance.id
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request."
  value       = aws_spot_instance_request.ec2_instance.spot_instance_id
}

output "public_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_spot_instance_request.ec2_instance.public_dns
}

output "availability_zone" {
  description = "The availability zone of the instance"
  value       = aws_spot_instance_request.ec2_instance.availability_zone
}

output "password_data" {
  description = "Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows."
  value       = aws_spot_instance_request.ec2_instance.password_data
}

output "private_ip" {
  description = "The private ip of the instance"
  value       = aws_spot_instance_request.ec2_instance.private_ip
}
