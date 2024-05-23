output "hosted_zone_zone_id" {
  description = "The Hosted Zone ID. This can be referenced by zone records."
  value       = aws_route53_zone.hosted_zone.zone_id
}

