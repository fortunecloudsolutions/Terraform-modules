output "id" {
  #{"type":"string","default":"tf-20210610212931009600000001"}
  description = "The name of the Neptune event notification subscription."
  value       = module.event_subscription.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:es:tf-20210610212931009600000001"}
  description = "The Amazon Resource Name of the Neptune event notification subscription."
  value       = module.event_subscription.arn
}

output "customer_aws_id" {
  #{"type":"string","default":"046692759124"}
  description = "The AWS customer account associated with the Neptune event notification subscription."
  value       = module.event_subscription.customer_aws_id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.event_subscription.tags_all
}

