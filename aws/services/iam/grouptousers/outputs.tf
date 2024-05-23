output "user" {
  #{"type":"string","default":"dummy"}
  description = "The name of the IAM User"
  value       = module.grouptousers.user
}

output "group" {
  #{"type":"string","default":"dummy"}
  description = "The list of IAM Groups"
  value       = module.grouptousers.group
}