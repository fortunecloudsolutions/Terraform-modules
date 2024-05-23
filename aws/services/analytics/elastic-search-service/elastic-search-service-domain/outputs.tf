output "arn" {
  #{"type":"string","default":"arn:aws:es:us-east-2:046692759124:domain/test-elasticsearch-domain"}
  description = "ARN of the domain."
  value       = module.domain.arn
}

output "domain_id" {
  #{"type":"string","default":"046692759124/test-elasticsearch-domain"}
  description = "Unique identifier for the domain."
  value       = module.domain.domain_id
}

output "domain_name" {
  #{"type":"string","default":"test-elasticsearch-domain"}
  description = "Name of the Elasticsearch domain."
  value       = module.domain.domain_name
}

output "endpoint" {
  #{"type":"string","default":"dummy"}
  description = "Domain-specific endpoint used to submit index, search, and data upload requests."
  value       = module.domain.endpoint
}

output "kibana_endpoint" {
  #{"type":"string","default":"search-test-elasticsearch-domain-t63wtsvpfjwnmcr6756sb3zmtq.us-east-2.es.amazonaws.com/_plugin/kibana/"}
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = module.domain.kibana_endpoint
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.domain.tags_all
}

/* output "vpc_options_availability_zones" {
  description = " If the domain was created inside a VPC, the names of the availability zones the configured subnet_ids were created inside."
  value       = module.domain.vpc_options.0.availability_zones
}

output "vpc_options_vpc_id" {
  description = "If the domain was created inside a VPC, the ID of the VPC."
  value       = module.domain.vpc_options.0.vpc_id
} */