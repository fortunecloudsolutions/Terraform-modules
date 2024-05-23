output "query_definition_id" {
  #{"type":"string","default":"1792a9c1-da7f-4f13-b3e4-cb7bf649b5c2"}
  description = "The query definition ID."
  value       = module.cloudwatch_query_definition.query_definition_id
}