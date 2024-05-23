output "id" {
  #{"type":"string","default":"test-crawler"}
  description = "Crawler name"
  value       = module.crawler.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:crawler/test-crawler"}
  description = "The ARN of the crawler"
  value       = module.crawler.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.crawler.tags_all
}

