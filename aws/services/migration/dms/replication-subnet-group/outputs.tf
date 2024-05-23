output "vpc_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the VPC the subnet group is in."
  value       = module.replication_subnet_group.vpc_id
}

output "replication_subnet_group_id" {
  #{"type":"string","default":"dummy"}
  description = "The name for the replication subnet group."
  value       = module.replication_subnet_group.replication_subnet_group_id
}
