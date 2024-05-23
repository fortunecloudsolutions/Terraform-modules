output "allocated_storage" {
  description = "Specifies the allocated storage size in gigabytes (GB)."
  value       = module.backup.allocated_storage
}

output "availability_zone" {
  #{"type":"list","default":["us-east-2"]}
  description = "Specifies the name of the Availability Zone the DB instance was located in at the time of the DB snapshot."
  value       = module.backup.availability_zone
}

output "db_snapshot_arn" {
  #{"type":"list","default":["arn:aws:rds:us-east-2:123456789012:db:my-snapshot-arn-1"]}
  description = "The Amazon Resource Name (ARN) for the DB snapshot."
  value       = module.backup.db_snapshot_arn
}

output "encrypted" {
  #{"type":"list","default":[true]}
  description = "Specifies whether the DB snapshot is encrypted."
  value       = module.backup.encrypted
}


output "engine" {
  #{"type":"list","default":["dummy"]}
  description = "Specifies the name of the database engine."
  value       = module.backup.engine
}

output "engine_version" {
  #{"type":"list","default":["dummy"]}
  description = "Specifies the version of the database engine."
  value       = module.backup.engine_version
}

output "source_db_snapshot_identifier" {
  #{"type":"list","default":["arn:aws:rds:us-east-2:123456789012:db:my-snapshot-arn-1"]}
  description = "The DB snapshot Arn that the DB snapshot was copied from.It only has value in case of cross customer or cross region copy."
  value       = module.backup.source_db_snapshot_identifier
}

output "status" {
  #{"type":"list","default":["dummy"]}
  description = "Specifies the status of this DB snapshot."
  value       = module.backup.status
}

output "storage_type" {
  #{"type":"list","default":["dummy"]}
  description = "Specifies the storage type associated with DB snapshot."
  value       = module.backup.storage_type
}
output "vpc_id" {
  #{"type":"list","default":["dummy"]}
  description = "Specifies the storage type associated with DB snapshot."
  value       = module.backup.vpc_id
}
