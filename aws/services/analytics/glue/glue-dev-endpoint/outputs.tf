output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:devEndpoint/test-dev-endpoint"}
  description = "The ARN of the endpoint."
  value       = module.dev_endpoint.arn
}

output "name" {
  #{"type":"string","default":"test-dev-endpoint"}
  description = "The name of the new endpoint."
  value       = module.dev_endpoint.name
}

output "private_address" {
  #{"type":"string","default":"dummy"}
  description = "A private IP address to access the endpoint within a VPC, if this endpoint is created within one."
  value       = module.dev_endpoint.private_address
}

output "public_address" {
  #{"type":"string","default":"ec2-3-138-200-202.us-east-2.compute.amazonaws.com"}
  description = "The public IP address used by this endpoint. The PublicAddress field is present only when you create a non-VPC endpoint."
  value       = module.dev_endpoint.public_address
}

output "yarn_endpoint_address" {
  #{"type":"string","default":"dummy"}
  description = "The YARN endpoint address used by this endpoint."
  value       = module.dev_endpoint.yarn_endpoint_address
}

output "zeppelin_remote_spark_interpreter_port" {
  #{"type":"number","default":"9007"}
  description = "The Apache Zeppelin port for the remote Apache Spark interpreter."
  value       = module.dev_endpoint.zeppelin_remote_spark_interpreter_port
}

output "availability_zone" {
  #{"type":"string","default":"us-east-2b"}
  description = "The AWS availability zone where this endpoint is located."
  value       = module.dev_endpoint.availability_zone
}

output "vpc_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the VPC used by this endpoint."
  value       = module.dev_endpoint.vpc_id
}

output "status" {
  #{"type":"string","default":"READY"}
  description = "The current status of this endpoint."
  value       = module.dev_endpoint.status
}

output "failure_reason" {
  #{"type":"string","default":"dummy"}
  description = "The reason for a current failure in this endpoint."
  value       = module.dev_endpoint.failure_reason
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = " A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.dev_endpoint.tags_all
}
