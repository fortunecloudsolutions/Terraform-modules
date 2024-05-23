output "fargate_arn" {
  #{"type":"string","default":"arn:aws:eks:us-west-2:666666666666:fargateprofile/myCluster/myFargateProfile/1cb1a11a-1dc1-1d11-cf11-1111f11fa111"}
  description = "Amazon Resource Name (ARN) of the EKS Fargate Profile."
  value       = module.fargate.fargate_arn
}

output "fargate_id" {
  #{"type":"string","default":"testcluster:myFargateProfile"}
  description = "EKS Cluster name and EKS Fargate Profile name separated by a colon (:)."
  value       = module.fargate.fargate_id
}

output "fargate_status" {
  #{"type":"string","default":"ACTIVE"}
  description = "Status of the EKS Fargate Profile."
  value       = module.fargate.fargate_status
}