output "allocated_storage" {
  #{"type":"number","default":"0"}
  description = "Specifies the allocated storage size in gigabytes (GB)."
  value       = module.cluster_snapshot.allocated_storage
}

output "availability_zones" {
  #{"type":"list","default":"[]"}
  description = "List of EC2 Availability Zones that instances in the DB cluster snapshot can be restored in."
  value       = module.cluster_snapshot.availability_zones
}

output "db_cluster_snapshot_arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:cluster-snapshot:test-snapshot"}
  description = "The Amazon Resource Name (ARN) for the DB Cluster Snapshot."
  value       = module.cluster_snapshot.db_cluster_snapshot_arn
}

output "engine" {
  #{"type":"string","default":"neptune"}
  description = "Specifies the name of the database engine."
  value       = module.cluster_snapshot.engine
}

output "engine_version" {
  #{"type":"string","default":"1.0.4.2"}
  description = " Version of the database engine for this DB cluster snapshot."
  value       = module.cluster_snapshot.engine_version
}

output "kms_key_id" {
  #{"type":"string","default":"dummy"}
  description = "If storage_encrypted is true, the AWS KMS key identifier for the encrypted DB cluster snapshot."
  value       = module.cluster_snapshot.kms_key_id
}

output "license_model" {
  #{"type":"string","default":"neptune"}
  description = "License model information for the restored DB cluster."
  value       = module.cluster_snapshot.license_model
}

output "port" {
  #{"type":"number","default":"0"}
  description = "Port that the DB cluster was listening on at the time of the snapshot."
  value       = module.cluster_snapshot.port
}

/* output "source_db_cluster_snapshot_identifier" {
  #{"type":"number","default":"0"}
  description = "The DB Cluster Snapshot Arn that the DB Cluster Snapshot was copied from. It only has value in case of cross customer or cross region copy."
  value       = module.cluster_snapshot.source_db_cluster_snapshot_identifier
}
 */
output "storage_encrypted" {
  #{"type":"bool","default":"false"}
  description = "Specifies whether the DB cluster snapshot is encrypted."
  value       = module.cluster_snapshot.storage_encrypted
}

output "status" {
  #{"type":"string","default":"available"}
  description = "The status of this DB Cluster Snapshot."
  value       = module.cluster_snapshot.status
}

output "vpc_id" {
  #{"type":"string","default":"vpc-5a863f32"}
  description = "The VPC ID associated with the DB cluster snapshot."
  value       = module.cluster_snapshot.vpc_id
}

