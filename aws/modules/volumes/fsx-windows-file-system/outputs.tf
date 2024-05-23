output "fsx_arn" {
  description = "Amazon Resource Name of the file system."
  value       = aws_fsx_windows_file_system.fsx_windows_file_system.arn
}

output "fsx_dns_name" {
  description = "DNS name for the file system, e.g. fs-12345678.corp.example.com (domain name matching the Active Directory domain name)"
  value       = aws_fsx_windows_file_system.fsx_windows_file_system.dns_name
}

output "fsx_id" {
  description = "Identifier of the file system, e.g. fs-12345678"
  value       = aws_fsx_windows_file_system.fsx_windows_file_system.id
}