output "arn" {
  description = "The ARN of the endpoint."
  value       = aws_glue_dev_endpoint.dev_endpoint.arn
}

output "name" {
  description = "The name of the new endpoint."
  value       = aws_glue_dev_endpoint.dev_endpoint.name
}

output "private_address" {
  description = "A private IP address to access the endpoint within a VPC, if this endpoint is created within one."
  value       = aws_glue_dev_endpoint.dev_endpoint.private_address
}

output "public_address" {
  description = "The public IP address used by this endpoint. The PublicAddress field is present only when you create a non-VPC endpoint."
  value       = aws_glue_dev_endpoint.dev_endpoint.public_address
}

output "yarn_endpoint_address" {
  description = "The YARN endpoint address used by this endpoint."
  value       = aws_glue_dev_endpoint.dev_endpoint.yarn_endpoint_address
}

output "zeppelin_remote_spark_interpreter_port" {
  description = "The Apache Zeppelin port for the remote Apache Spark interpreter."
  value       = aws_glue_dev_endpoint.dev_endpoint.zeppelin_remote_spark_interpreter_port
}

output "availability_zone" {
  description = "The AWS availability zone where this endpoint is located."
  value       = aws_glue_dev_endpoint.dev_endpoint.availability_zone
}

output "vpc_id" {
  description = "The ID of the VPC used by this endpoint."
  value       = aws_glue_dev_endpoint.dev_endpoint.vpc_id
}

output "status" {
  description = "The current status of this endpoint."
  value       = aws_glue_dev_endpoint.dev_endpoint.status
}

output "failure_reason" {
  description = "The reason for a current failure in this endpoint."
  value       = aws_glue_dev_endpoint.dev_endpoint.failure_reason
}

output "tags_all" {
  description = " A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_glue_dev_endpoint.dev_endpoint.tags_all
}
