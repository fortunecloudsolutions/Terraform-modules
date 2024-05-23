output "id" {
  description = "The name of the Neptune event notification subscription."
  value       = aws_neptune_event_subscription.event_subscription.id
}

output "arn" {
  description = "The Amazon Resource Name of the Neptune event notification subscription."
  value       = aws_neptune_event_subscription.event_subscription.arn
}

output "customer_aws_id" {
  description = "The AWS customer account associated with the Neptune event notification subscription."
  value       = aws_neptune_event_subscription.event_subscription.customer_aws_id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_neptune_event_subscription.event_subscription.tags_all
}

