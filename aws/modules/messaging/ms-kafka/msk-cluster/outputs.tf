output "arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster."
  value       = aws_msk_cluster.msk.arn
}
output "cluster_current_version" {
  description = "Current version of the MSK Cluster used for updates, e.g. K13V1IB3VIYZZH."
  value       = aws_msk_cluster.msk.current_version
}
output "zookeeper_connect_string" {
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster."
  value       = aws_msk_cluster.msk.zookeeper_connect_string
}
