
output "nlb_arn" {
  #{"type":"string","default":"dummy"}
  description = " The ARN of the NLB  load balancer"
  value       = module.nlb.nlb_arn
}

output "nlb_dns_name" {
  #{"type":"string","default":"dummy"}
  description = "The DNS name of the Network load balancer"
  value       = module.nlb.nlb_dns_name
}