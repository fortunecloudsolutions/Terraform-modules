output "nodegroup_arn" {
  #{"type":"string","default":"arn:aws:eks:us-east-2:666666666666:nodegroup/sampleclustername/nodegroupname/34bbff2a-548b-effb-bcff-b580bb959295"}
  description = "Amazon Resource Name (ARN) of the EKS Node Group."
  value       = module.node_groups.nodegroup_arn
}

output "nodegroup_id" {
  #{"type":"string","default":"sampleclustername:nodegroupname"}
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
  value       = module.node_groups.nodegroup_id
}

output "nodegroup_status" {
  #{"type":"string","default":"ACTIVE"}
  description = "Status of the EKS Node Group."
  value       = module.node_groups.nodegroup_status
}
