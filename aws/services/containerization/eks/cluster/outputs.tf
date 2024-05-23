output "cluster_arn" {
  #{"type":"string","default":"arn:aws:eks:us-east-2:123456789012:cluster/testcluster"}
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = module.aws_eks_cluster.cluster_arn
}

output "cluster_id" {
  #{"type":"string","default":"testcluster"}
  description = "The name of the cluster."
  value       = module.aws_eks_cluster.cluster_id
}

output "cluster_status" {
  #{"type":"string","default":"ACTIVE"}
  description = "The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED."
  value       = module.aws_eks_cluster.cluster_status
}
output "cluster_version" {
  #{"type":"string","default":"1.18"}
  description = "The Kubernetes server version for the cluster."
  value       = module.aws_eks_cluster.cluster_version
}
