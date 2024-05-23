output "id" {
  #{"type":"string","default":"arn:aws:ecs:us-east-2:046692759124:cluster/ecstest,Hello World"}
  description = "ECS resource identifier and key, separated by a comma (,)"
  value       = module.aws_ecs_tag.id
}
