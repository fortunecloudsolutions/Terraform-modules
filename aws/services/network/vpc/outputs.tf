output "vpc_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
