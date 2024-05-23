output "id" {
  description = "The name of the rule."
  value       = aws_cloudwatch_event_rule.event_rule.id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) of the rule."
  value       = aws_cloudwatch_event_rule.event_rule.arn
}

output "name" {
  description = "The name of the rule."
  value       = aws_cloudwatch_event_rule.event_rule.name
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_cloudwatch_event_rule.event_rule.tags_all
}