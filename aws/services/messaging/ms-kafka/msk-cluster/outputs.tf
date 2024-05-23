output "arn" {
  #{"type":"string","default":"arn:aws:kafka:us-east-2:111222333444:cluster/SalesCluster/abcd1234-abcd-cafe-abab-9876543210ab-4"}
  description = "Amazon Resource Name (ARN) of the MSK cluster."
  value       = module.msk.arn
}
output "cluster_current_version" {
  #{"type":"string","default":"K13V1IB3VIYZZH"}
  description = "Current version of the MSK Cluster used for updates, e.g. K13V1IB3VIYZZH."
  value       = module.msk.cluster_current_version
}
output "zookeeper_connect_string" {
  #{"type":"string","default":"z-3.test-cluster.ecr35h.c2.kafka.us-east-2.amazonaws.com:2181"}
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster."
  value       = module.msk.zookeeper_connect_string
}
