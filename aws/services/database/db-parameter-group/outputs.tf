output "dbparam_id" {
  #{"type":"string","default":"mssql-db-param-grp"}
  description = "The db parameter group name."
  value       = module.parameter-group.dbparam_id

}
output "dbparam_arn" {
  #{"type":"string","default":"arn:aws:ecs:us-west-2:123456789012:pg:mssql-db-param-grp"}
  description = " The ARN of the db parameter group.."
  value       = module.parameter-group.dbparam_arn
}

