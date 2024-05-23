output "address" {
  description = "The Neptune Cluster Amazon Resource Name (ARN)"
  value       = aws_neptune_cluster_instance.cluster_instance.address
}

output "arn" {
  description = "Amazon Resource Name (ARN) of neptune instance"
  value       = aws_neptune_cluster_instance.cluster_instance.arn
}

output "dbi_resource_id" {
  description = "The region-unique, immutable identifier for the neptune instance."
  value       = aws_neptune_cluster_instance.cluster_instance.dbi_resource_id
}

output "endpoint" {
  description = "The connection endpoint in address:port format."
  value       = aws_neptune_cluster_instance.cluster_instance.endpoint
}

output "id" {
  description = "The Instance identifier"
  value       = aws_neptune_cluster_instance.cluster_instance.id
}

output "kms_key_arn" {
  description = "The ARN for the KMS encryption key if one is set to the neptune cluster."
  value       = aws_neptune_cluster_instance.cluster_instance.kms_key_arn
}

output "storage_encrypted" {
  description = "Specifies whether the neptune cluster is encrypted."
  value       = aws_neptune_cluster_instance.cluster_instance.storage_encrypted
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_neptune_cluster_instance.cluster_instance.tags_all
}

output "writer" {
  description = "Boolean indicating if this instance is writable. False indicates this instance is a read replica."
  value       = aws_neptune_cluster_instance.cluster_instance.writer
}

