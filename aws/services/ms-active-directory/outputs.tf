output "ms_active_directory_id" {
  #{"type":"string","default":"d-9a672b9fbe"}
  description = "The directory identifier."
  value       = module.ms_active_directory.activedir_id
}