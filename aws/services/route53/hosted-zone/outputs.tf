output "hosted_zone_id" {
  #{"type":"string","default":"dummy"}
  description = "The Hosted Zone ID. This can be referenced by zone records."
  value       = module.hosted_zone.hosted_zone_zone_id
}

