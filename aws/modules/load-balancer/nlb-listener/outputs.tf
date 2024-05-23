
output "nlb_listener" {
  description = "The ARN of the NLB listener"
  value       = aws_lb_listener.nlb_listnr.arn
}
