
output "target_alb_arn" {
  #{"type":"string","default":"arn:aws:elasticloadbalancing:us-east-2:046692759124:targetgroup/substitute"}
  description = "The ARN of the ALB Target Group"
  value       = module.alb.target_arn
}
