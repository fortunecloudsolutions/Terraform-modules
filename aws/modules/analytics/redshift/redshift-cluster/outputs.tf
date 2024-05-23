output "arn" {
  description = "Amazon Resource Name (ARN) of cluster"
  value       = aws_redshift_cluster.cluster.arn
}

output "id" {
  description = "The Redshift Cluster ID."
  value       = aws_redshift_cluster.cluster.id
}

output "cluster_identifier" {
  description = "The Cluster Identifier"
  value       = aws_redshift_cluster.cluster.cluster_identifier
}

output "cluster_type" {
  description = "The cluster type"
  value       = aws_redshift_cluster.cluster.cluster_type
}

output "node_type" {
  description = "The type of nodes in the cluster"
  value       = aws_redshift_cluster.cluster.node_type
}

output "database_name" {
  description = "The name of the default database in the Cluster"
  value       = aws_redshift_cluster.cluster.database_name
}

output "availability_zone" {
  description = "The availability zone of the Cluster"
  value       = aws_redshift_cluster.cluster.availability_zone
}

output "automated_snapshot_retention_period" {
  description = "The backup retention period"
  value       = aws_redshift_cluster.cluster.automated_snapshot_retention_period
}

output "preferred_maintenance_window" {
  description = "The backup window"
  value       = aws_redshift_cluster.cluster.preferred_maintenance_window
}

output "endpoint" {
  description = "The connection endpoint"
  value       = aws_redshift_cluster.cluster.endpoint
}

output "encrypted" {
  description = "Whether the data in the cluster is encrypted"
  value       = aws_redshift_cluster.cluster.encrypted
}

output "cluster_security_groups" {
  description = "The security groups associated with the cluster"
  value       = aws_redshift_cluster.cluster.cluster_security_groups
}

output "vpc_security_group_ids" {
  description = "The VPC security group Ids associated with the cluster"
  value       = aws_redshift_cluster.cluster.vpc_security_group_ids
}

output "dns_name" {
  description = "The DNS name of the cluster"
  value       = aws_redshift_cluster.cluster.dns_name
}

output "port" {
  description = "The Port the cluster responds on"
  value       = aws_redshift_cluster.cluster.port
}

output "cluster_version" {
  description = "The version of Redshift engine software"
  value       = aws_redshift_cluster.cluster.cluster_version
}

output "cluster_parameter_group_name" {
  description = "The name of the parameter group to be associated with this cluster"
  value       = aws_redshift_cluster.cluster.cluster_parameter_group_name
}

output "cluster_subnet_group_name" {
  description = "The name of a cluster subnet group to be associated with this cluster"
  value       = aws_redshift_cluster.cluster.cluster_subnet_group_name
}

output "cluster_public_key" {
  description = "The public key for the cluster"
  value       = aws_redshift_cluster.cluster.cluster_public_key
}

output "cluster_revision_number" {
  description = "The specific revision number of the database in the cluster."
  value       = aws_redshift_cluster.cluster.cluster_revision_number
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_redshift_cluster.cluster.tags_all
}

output "jdbc_url" {
  description = "The jdbc url of redshift cluster."
  value       = "jdbc:redshift://${aws_redshift_cluster.cluster.endpoint}/${aws_redshift_cluster.cluster.database_name}"
}

