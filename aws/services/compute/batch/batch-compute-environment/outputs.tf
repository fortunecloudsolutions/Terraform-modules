output "arn" {
  #{"type":"string","default":"arn:aws:batch:us-east-2:046692759124:compute-environment/test-compute-env"}
  description = "The Amazon Resource Name (ARN) of the compute environment."
  value       = module.compute_environment.arn
}

output "ecs_cluster_arn" {
  #{"type":"string","default":"arn:aws:ecs:us-east-2:046692759124:cluster/test-compute-env_Batch_5b5e8e6c-6598-35a6-9bd7-6580ceee6279"}
  description = "The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used by the compute environment."
  value       = module.compute_environment.ecs_cluster_arn
}

output "status" {
  #{"type":"string","default":"VALID"}
  description = "The current status of the compute environment (for example, CREATING or VALID)."
  value       = module.compute_environment.status
}

output "status_reason" {
  #{"type":"string","default":"ComputeEnvironment Healthy"}
  description = "A short, human-readable string to provide additional details about the current status of the compute environment"
  value       = module.compute_environment.status_reason
}

