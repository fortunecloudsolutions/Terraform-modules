
output "register_attachment_id" {
  #{"type":"list","default":["dummy"]}
  description = "A unique identifier for the ALB target group attachment"
  value       = module.register_alb.register_id
}
