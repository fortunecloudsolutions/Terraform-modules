output "health_check_id" {
  #{"type":"string","default":"dummy"}
  description = "The id of the health check."
  value       = module.health_check.health_check_id
}

