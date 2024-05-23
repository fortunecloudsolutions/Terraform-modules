output "dashboard_arn" {
  description = "The Amazon Resource Name (ARN) of the dashboard."
  value       = aws_cloudwatch_dashboard.cloudwatch_dashboard.dashboard_arn
}

