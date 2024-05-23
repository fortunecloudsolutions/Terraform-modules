output "id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the DHCP Options Set."
  value       = aws_vpc_dhcp_options.dns_resolver.id
}


output "arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the DHCP Options Set"
  value       = aws_vpc_dhcp_options.dns_resolver.arn
}

output "domain_name_servers" {
  #{"type":"list","default":"[]"}
  description = "The Domain Name Servers of the DHCP Options Set"
  value       = aws_vpc_dhcp_options.dns_resolver.domain_name_servers
}
