output "arn" {
  #{"type":"string","default":"arn:aws:redshift:us-east-2:046692759124:cluster:test-cluster"}
  description = "Amazon Resource Name (ARN) of cluster"
  value       = module.cluster.arn
}

output "id" {
  #{"type":"string","default":"test-cluster"}
  description = "The Redshift Cluster ID."
  value       = module.cluster.id
}

output "cluster_identifier" {
  #{"type":"string","default":"test-cluster"}
  description = "The Cluster Identifier"
  value       = module.cluster.cluster_identifier
}

output "cluster_type" {
  #{"type":"string","default":"single-node"}
  description = "The cluster type"
  value       = module.cluster.cluster_type
}

output "node_type" {
  #{"type":"string","default":"dc2.large"}
  description = "The type of nodes in the cluster"
  value       = module.cluster.node_type
}

output "database_name" {
  #{"type":"string","default":"dev"}
  description = "The name of the default database in the Cluster"
  value       = module.cluster.database_name
}

output "availability_zone" {
  #{"type":"string","default":"us-east-2a"}
  description = "The availability zone of the Cluster"
  value       = module.cluster.availability_zone
}

output "automated_snapshot_retention_period" {
  #{"type":"number","default":"1"}
  description = "The backup retention period"
  value       = module.cluster.automated_snapshot_retention_period
}

output "preferred_maintenance_window" {
  #{"type":"string","default":"mon:05:00-mon:05:30"}
  description = "The backup window"
  value       = module.cluster.preferred_maintenance_window
}

output "endpoint" {
  #{"type":"string","default":"test-cluster.cjyxyez8b17f.us-east-2.redshift.amazonaws.com:5439"}
  description = "The connection endpoint"
  value       = module.cluster.endpoint
}

output "encrypted" {
  #{"type":"bool","default":"false"}
  description = "Whether the data in the cluster is encrypted"
  value       = module.cluster.encrypted
}

output "cluster_security_groups" {
  #{"type":"list","default":"[]"}
  description = "The security groups associated with the cluster"
  value       = module.cluster.cluster_security_groups
}

output "vpc_security_group_ids" {
  #{"type":"list","default":"[]"}
  description = "The VPC security group Ids associated with the cluster"
  value       = module.cluster.vpc_security_group_ids
}

output "dns_name" {
  #{"type":"string","default":"test-cluster.cjyxyez8b17f.us-east-2.redshift.amazonaws.com"}
  description = "The DNS name of the cluster"
  value       = module.cluster.dns_name
}

output "port" {
  #{"type":"number","default":"5439"}
  description = "The Port the cluster responds on"
  value       = module.cluster.port
}

output "cluster_version" {
  #{"type":"string","default":"1.0"}
  description = "The version of Redshift engine software"
  value       = module.cluster.cluster_version
}

output "cluster_parameter_group_name" {
  #{"type":"string","default":"default.redshift-1.0"}
  description = "The name of the parameter group to be associated with this cluster"
  value       = module.cluster.cluster_parameter_group_name
}

output "cluster_subnet_group_name" {
  #{"type":"string","default":"default"}
  description = "The name of a cluster subnet group to be associated with this cluster"
  value       = module.cluster.cluster_subnet_group_name
}

output "cluster_public_key" {
  #{"type":"string","default":"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCuHMdby/Dds0le9ztcB3CF5lfAhiOzytWLiXaBDZaLqAhusMWBYrPr6olwIzy8QFzZzxoiaxxHf4RcWHaMimtW2N4J+Az6Kfy6j0Hz2jEp+9VIj/rzYiznuI6J55pPlN9xG3GJokboTnJxGCLxIWexugm0mdTHxXXgONXiGByDiUWRZgv7rLu452k/pU9fIHjoQoatxU6YeeSNwFAG9MkSvNqNm5IpYQdT/YbmVEtqyrPtf2+WuDY+IjhV4yZDwstgbFck6aOxds5LAfJ1Wucb2U5BL/jX7Aea4efy5ZRsYnnTyKRIzqTwI5Dud/RAake1eKUuVRR/ySTaQ3nZ+Kj Amazon-Redshift\n"}
  description = "The public key for the cluster"
  value       = module.cluster.cluster_public_key
}

output "cluster_revision_number" {
  #{"type":"string","default":"27554"}
  description = "The specific revision number of the database in the cluster."
  value       = module.cluster.cluster_revision_number
}


output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cluster.tags_all
}

 output "jdbc_url" {
  #{"type":"string","default":"{}"}
  description = "The jdbc url of redshift cluster."
  value       = module.cluster.jdbc_url
}


