output "membership_name" {
  #{"type":"string","default":"dummy"}
  description = " The name to identify the Group Membership"
  value       = module.groupmem.membership_name
}

output "users" {
  #{"type":"string","default":"dummy"}
  description = " list of IAM User names"
  value       = module.groupmem.users
}
output "groups" {
  #{"type":"string","default":"dummy"}
  description = " IAM Group name"
  value       = module.groupmem.groups
}
