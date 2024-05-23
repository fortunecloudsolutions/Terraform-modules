
output "register_id" {
  description = "A unique identifier for the attachment"
  value       = aws_lb_target_group_attachment.register.*.id
}
