output "option_group_id" {
  #{"type":"string","default":"default:oracle-ee-19"}
  description = "The db option group name."
  value       = module.option-group.option_group_id

}
output "option_group_arn" {
  #{"type":"string","default":"arn:aws:rds:us-west-1:111122223333:og:default:oracle-ee-19"}
  description = "The ARN of the db option group."
  value       = module.option-group.option_group_arn

}
