output "arn" {
  #{"type":"string","default":"arn:aws:redshift:us-east-2:046692759124:eventsubscription:event-subscription-test"}
  description = "Amazon Resource Name (ARN) of the Redshift event notification subscription"
  value       = module.event_subscription.arn
}

output "id" {
  #{"type":"string","default":"046692759124"}
  description = "The name of the Redshift event notification subscription"
  value       = module.event_subscription.id
}

output "customer_aws_id" {
  #{"type":"string","default":"dummy"}
  description = "The AWS customer account associated with the Redshift event notification subscription"
  value       = module.event_subscription.customer_aws_id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.event_subscription.tags_all
}
