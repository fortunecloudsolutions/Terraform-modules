output "replication_instance_arn" {
  #{"type":"string","default":"arn:dummy"}
  description = "The Amazon Resource Name (ARN) of the replication instance."
  value       = aws_dms_replication_instance.replication_instance.replication_instance_arn
}

output "replication_instance_private_ips" {
  #{"type":"string","default":"dummy"}
  description = "A list of the private IP addresses of the replication instance."
  value       = aws_dms_replication_instance.replication_instance.replication_instance_private_ips
}

output "replication_instance_public_ips" {
  #{"type":"string","default":"dummy"}
  description = "A list of the public IP addresses of the replication instance."
  value       = aws_dms_replication_instance.replication_instance.replication_instance_public_ips
}