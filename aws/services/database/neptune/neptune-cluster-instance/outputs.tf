output "address" {
  #{"type":"string","default":"tf-20210610193559231500000001.csgcgjtsgsc5.us-east-2.neptune.amazonaws.com"}
  description = "The Neptune Cluster Amazon Resource Name (ARN)"
  value       = module.cluster_instance.address
}

output "arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:db:tf-20210610193559231500000001"}
  description = "Amazon Resource Name (ARN) of neptune instance"
  value       = module.cluster_instance.arn
}

output "dbi_resource_id" {
  #{"type":"string","default":"db-5OEBWL7KYB6HSJYFBGARPR5R3I"}
  description = "The region-unique, immutable identifier for the neptune instance."
  value       = module.cluster_instance.dbi_resource_id
}

output "endpoint" {
  #{"type":"string","default":"tf-20210610193559231500000001.csgcgjtsgsc5.us-east-2.neptune.amazonaws.com:8182"}
  description = "The connection endpoint in address:port format."
  value       = module.cluster_instance.endpoint
}

output "id" {
  #{"type":"string","default":"tf-20210610193559231500000001"}
  description = "The Instance identifier"
  value       = module.cluster_instance.id
}

output "kms_key_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN for the KMS encryption key if one is set to the neptune cluster."
  value       = module.cluster_instance.kms_key_arn
}

output "storage_encrypted" {
  #{"type":"bool","default":"false"}
  description = "Specifies whether the neptune cluster is encrypted."
  value       = module.cluster_instance.storage_encrypted
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cluster_instance.tags_all
}

output "writer" {
  #{"type":"bool","default":"true"}
  description = "Boolean indicating if this instance is writable. False indicates this instance is a read replica."
  value       = module.cluster_instance.writer
}

