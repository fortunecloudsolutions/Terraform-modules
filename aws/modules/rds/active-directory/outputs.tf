output "activedir_id" {
  description = "The directory identifier."
  value       = aws_directory_service_directory.rds_ad.id
}
output "access_url" {
  description = " The access URL for the directory, such as http://alias.awsapps.com."
  value       = aws_directory_service_directory.rds_ad.access_url

}
output "dns_ip_addresses" {
  description = "A list of IP addresses of the DNS servers for the directory or connector."
  value       = aws_directory_service_directory.rds_ad.dns_ip_addresses

}
output "security_group_id" {
  description = "The ID of the security group created by the directory."
  value       = aws_directory_service_directory.rds_ad.security_group_id

}
