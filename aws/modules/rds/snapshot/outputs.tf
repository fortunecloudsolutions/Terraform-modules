

output "availability_zone" {
  description = "Specifies the name of the Availability Zone the DB instance was located in at the time of the DB snapshot."
  value       = aws_db_snapshot.backup.*.availability_zone
}

output "db_snapshot_arn" {
  description = "The Amazon Resource Name (ARN) for the DB snapshot."
  value       = aws_db_snapshot.backup.*.db_snapshot_arn
}

output "encrypted" {
  description = "Specifies whether the DB snapshot is encrypted."
  value       = aws_db_snapshot.backup.*.encrypted
}

output "allocated_storage" {
  description = "Specifies the allocated storage size in gigabytes (GB)."
  value       = aws_db_snapshot.backup.*.allocated_storage
}
output "engine" {
  description = "Specifies the name of the database engine."
  value       = aws_db_snapshot.backup.*.engine
}

output "engine_version" {
  description = "Specifies the version of the database engine."
  value       = aws_db_snapshot.backup.*.engine_version
}

output "source_db_snapshot_identifier" {
  description = "The DB snapshot Arn that the DB snapshot was copied from.It only has value in case of cross customer or cross region copy."
  value       = aws_db_snapshot.backup.*.source_db_snapshot_identifier
}

output "status" {
  description = "Specifies the status of this DB snapshot."
  value       = aws_db_snapshot.backup.*.status
}

output "storage_type" {
  description = "Specifies the storage type associated with DB snapshot."
  value       = aws_db_snapshot.backup.*.storage_type
}
output "vpc_id" {
  description = "Specifies the storage type associated with DB snapshot."
  value       = aws_db_snapshot.backup.*.vpc_id
}
