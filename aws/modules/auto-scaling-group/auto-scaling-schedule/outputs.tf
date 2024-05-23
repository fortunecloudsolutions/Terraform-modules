output "asg_schedule_arn" {
  description = "The ARN assigned by AWS to the autoscaling schedule."
  value       = aws_autoscaling_schedule.asg_schedule.arn
}