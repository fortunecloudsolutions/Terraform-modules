output "arn" {
  description = "Amazon Resource Name (ARN) of the Redshift event notification subscription"
  value       = aws_redshift_event_subscription.event_subscription.arn
}

output "id" {
  description = "The name of the Redshift event notification subscription"
  value       = aws_redshift_event_subscription.event_subscription.id
}

output "customer_aws_id" {
  description = "The AWS customer account associated with the Redshift event notification subscription"
  value       = aws_redshift_event_subscription.event_subscription.customer_aws_id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_redshift_event_subscription.event_subscription.tags_all
}
