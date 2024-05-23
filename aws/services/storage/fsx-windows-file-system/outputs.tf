output "fsx_arn" {
  #{"type":"string","default":"arn:aws:fsx:us-east-2:111122223333:file-system/fs-12345678"}
  description = "Amazon Resource Name of the file system."
  value       = module.fsx_windows.fsx_arn
}

output "fsx_dns_name" {
  #{"type":"string","default":"fs-0123456789abcdef0.substitute.com"}
  description = "DNS name for the file system, e.g. fs-12345678.corp.example.com (domain name matching the Active Directory domain name)"
  value       = module.fsx_windows.fsx_dns_name
}

output "fsx_id" {
  #{"type":"string","default":"fs-12345678"}
  description = "Identifier of the file system, e.g. fs-12345678"
  value       = module.fsx_windows.fsx_id
}