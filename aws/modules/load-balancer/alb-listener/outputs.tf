
output "alb_listener_arn" {
  description = "The ARN of the listener"
  value       = aws_lb_listener.alb_listnr.arn
}
