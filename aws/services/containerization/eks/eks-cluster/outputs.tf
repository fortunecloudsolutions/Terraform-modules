output "cluster_arn" {
  #{"type":"string","default":"arn:aws:eks:us-east-2:123456789012:cluster/testcluster"}
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = module.aws_eks_cluster.cluster_arn
}

output "cluster_name" {
  #{"type":"string","default":"testcluster"}
  description = "The name of the cluster."
  value       = module.aws_eks_cluster.cluster_name
}

output "cluster_status" {
  #{"type":"string","default":"ACTIVE"}
  description = "The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED."
  value       = module.aws_eks_cluster.cluster_status
}

output "cluster_platform_version" {
  #{"type":"string","default":"1.18"}
  description = "The Kubernetes platform version for the cluster."
  value       = module.aws_eks_cluster.cluster_platform_version
}

output "cluster_version" {
  #{"type":"string","default":"eks.2"}
  description = "The Kubernetes server version for the cluster."
  value       = module.aws_eks_cluster.cluster_version
}

output "cluster_certificate_authority_data" {
  #{"type":"string","default":"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeE1UQXlOakl3TVRFek5sb1hEVE14TVRBeU5ESXdNVEV6Tmxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBS0xZClVzZnAyMmJJckRDTVpsM1ppSHJ2Q1NnMnJuWlR6WDRldUFGUDRkRVhQdlhOaGtaUGhTZmNHbmJucGlWYlZQSlIKUGRhSFJtcGpjWjhmS1dId2Nqd0pNb09jUk41UXpCbm56TXAwRFAwV3ZGMXhMeUJ1VnZTTEI5Sm1WQ1pOa3Q1SgpOWEczVWtXcmdxRWFJeS9kWHdxSllWamZ2QTdLWmM5QTZQV1BOK0NiY2JUWSs3Zm45NldsQ0Jhclk3QmNkanc1CkUzWmFxcGIrbVkvaUtyMkVtMGVjNHp4R3dHZFZoWXZmZTBiTDFiQ1hlWnF4dFJpeXB5R2hXZzcxTlF5ampqNHgKT2R1dnBDZk9BR2VhRndGWVB6TXM2Uk9NK1hsN1Nkb1h5ck9qaTlydEJ2SFY2a1hEU0FpL2VDV3FzaTA4NjFnaQpma1BhbG5wWVhJaEo2NkVRL0tVQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZNbHlUMU1ib0V6R1dQR1lFRDJLTkw1aExJSERNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFCR2V2NTZ6MUZsbENnUHJjYmVoTDhKNCtiQnNPcVlyZzQ2N2ZHMktkd3J5dnBDQ09KMApNdTR0cG9MbW5FemhSVWNUSE5aaGRrN2Z6MkkrSnVobkdKN3ZxVk1jczNVcHBHQ0JLR1ZoTFhLRkNLRlBaQUgrCnJWMnA4RUZnQk0zU3hHM1BOZTJlanBxVlBxcVZIa3VYS2xKZGdYUDlrQ05wT3pYK1NqUm51T1NSaDNDdTNJU1MKcUUyK0pma3dsZmhyb3JEU3YyZXV1SHZTTlV2SW94cEhWNjFrVlk2WE94MHZsZHd5NUlLOVhXcEJpNE5NdTNrSgpuN1VZYTRMMFdKYklLYVdJem5UUXYyZ1p1d1h1MUQ1eG5IQWtCb0hGRTNnZFV2UHVOazhYK1dMUFkzMXBwc0lhCnEwajhVNkJydlErbVhkUWdFTlBZSmZEcEpQMVJPYUFISUFFagotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="}
  description = "Base64 encoded certificate data required to communicate with your cluster."
  value       = module.aws_eks_cluster.cluster_certificate_authority_data
}

output "cluster_server_endpoint" {
  #{"type":"string","default":"https://0DF513ADEBDAB94BB7218A7308800FF3.yl4.us-east-2.eks.amazonaws.com"}
  description = "Endpoint for your Kubernetes API server."
  value       = module.aws_eks_cluster.cluster_server_endpoint
}

output "cluster_region" {
  #{"type":"string","default":"us-east-2"}
  description = "The AWS region in which the cluster is deployed."
  value       = var.region
}

output "kubeconfig" {
  #{"type":"string","default":"rendered"}
  value       = base64encode(data.template_file.config.rendered)
  description = "The kubeconfig for the eks cluster"
}
