output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = aws_eks_cluster.cluster.arn
}

output "cluster_name" {
  description = "The name of the cluster."
  value       = aws_eks_cluster.cluster.id
}

output "cluster_status" {
  description = "The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED."
  value       = aws_eks_cluster.cluster.status
}

output "cluster_platform_version" {
  description = "The Kubernetes platform version for the cluster."
  value       = aws_eks_cluster.cluster.platform_version
}

output "cluster_version" {
  description = "The Kubernetes server version for the cluster."
  value       = aws_eks_cluster.cluster.version
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.cluster.certificate_authority[0].data
}

output "cluster_server_endpoint" {
  description = "Endpoint for your Kubernetes API server."
  value       = aws_eks_cluster.cluster.endpoint
}
