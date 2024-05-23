output "dashboard_arn" {
  #{"type":"string","default":"arn:aws:cloudwatch::046692759124:dashboard/test-dashboard"}
  description = "The Amazon Resource Name (ARN) of the dashboard."
  value       = module.cloudwatch_dashboard.dashboard_arn
}


