output "asg_schedule_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN assigned by AWS to the autoscaling schedule."
  value       = module.asg_schedule.asg_schedule_arn
}