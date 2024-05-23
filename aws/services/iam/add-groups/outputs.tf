output "group_id" {
  #{"type":"string","default":"dummy"}
  description = "The group's ID"
  value       = module.groups.group_id
}

output "group_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN assigned by AWS for this group"
  value       = module.groups.group_arn
}
output "group_name" {
  #{"type":"string","default":"dummy"}
  description = "The group's name"
  value       = module.groups.group_name
}
output "group_unique_id" {
  #{"type":"string","default":"dummy"}
  description = "The unique ID assigned by AW"
  value       = module.groups.group_unique_id
}