
output "nlb_listener_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the NLB listener"
  value       = module.nlb_listener.nlb_listener
}
