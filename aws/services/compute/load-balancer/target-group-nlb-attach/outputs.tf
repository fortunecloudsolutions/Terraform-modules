
output "register_attachment_id" {
  #{"type":"list","default":["dummy"]}
  description = "A unique identifier for the NLB target group attachment"
  value       = module.register_nlb.register_id
}
