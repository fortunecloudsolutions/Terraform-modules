output "vpc_peering_options_id" {
  #{"type":"string","default":"pcx-02aab175985d8cf93"}
  description = "The ID of the VPC Peering Connection."
  value       = module.vpc_peering_options.id
}
