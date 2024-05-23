output "id" {
   #{"type":"string","default":"dummy"}
  description = "The task_set_id, service and cluster separated by commas (,)."
  value       = module.task_set.id
}
output "arn" {
   #{"type":"string","default":"dummy"}
  description = "The Amazon Resource Name (ARN) that identifies the task set."
  value       = module.task_set.arn
}
output "stability_status" {
   #{"type":"string","default":"dummy"}
  description = " The stability status. This indicates whether the task set has reached a steady state."
  value       = module.task_set.stability_status
}
output "status" {
   #{"type":"string","default":"dummy"}
  description = " The status of the task set."
  value       = module.task_set.status
}
output "task_set_id" {
   #{"type":"string","default":"dummy"}
  description = " The ID of the task set."
  value       = module.task_set.task_set_id
}
output "tags_all" {
   #{"type":"string","default":"dummy"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.task_set.tags_all
}
