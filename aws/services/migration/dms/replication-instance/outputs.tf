output "replication_instance_arn" {
  #{"type":"string","default":"arn:aws:dms:us-east-1:123456789012:rep:T3OM7OUB5NM2LCVZF7JPGJRNUE"}
  description = "The Amazon Resource Name (ARN) of the replication instance."
  value       = module.replication_instance.replication_instance_arn
}

output "replication_instance_private_ips" {
  #{"type":"list","default":["dummy"]}
  description = "A list of the private IP addresses of the replication instance."
  value       = module.replication_instance.replication_instance_private_ips
}

output "replication_instance_public_ips" {
  #{"type":"list","default":["dummy"]}
  description = "A list of the public IP addresses of the replication instance."
  value       = module.replication_instance.replication_instance_public_ips
}