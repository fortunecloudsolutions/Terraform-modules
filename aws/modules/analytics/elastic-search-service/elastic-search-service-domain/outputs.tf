output "arn" {
  description = "ARN of the domain."
  value       = aws_elasticsearch_domain.domain.arn
}

output "domain_id" {
  description = "Unique identifier for the domain."
  value       = aws_elasticsearch_domain.domain.domain_id
}

output "domain_name" {
  description = "Name of the Elasticsearch domain."
  value       = aws_elasticsearch_domain.domain.domain_name
}

output "endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests."
  value       = aws_elasticsearch_domain.domain.endpoint
}

output "kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = aws_elasticsearch_domain.domain.kibana_endpoint
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_elasticsearch_domain.domain.tags_all
}

/* output "vpc_options_availability_zones" {
  description = " If the domain was created inside a VPC, the names of the availability zones the configured subnet_ids were created inside."
  value       = aws_elasticsearch_domain.domain.vpc_options.0.availability_zones
}

output "vpc_options_vpc_id" {
  description = "If the domain was created inside a VPC, the ID of the VPC."
  value       = aws_elasticsearch_domain.domain.vpc_options.0.vpc_id
} */