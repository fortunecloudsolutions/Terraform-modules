output "id" {
  #{"type":"string","default":"test-cloudwatch-metric-filters"}
  description = "The Amazon Resource Name (ARN) specifying the log group. Any :* suffix added by the API, denoting all CloudWatch Log Streams under the CloudWatch Log Group, is removed for greater compatibility with other AWS services that do not accept the suffix."
  value       = module.cloudwatch_log_metric_filter.id
}


