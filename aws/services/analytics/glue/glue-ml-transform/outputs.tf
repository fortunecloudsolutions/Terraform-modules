output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:mlTransform/tfm-9432905892f259ccdddaf2df13a1f5aed8892b4b"}
  description = "Amazon Resource Name (ARN) of Glue ML Transform."
  value       = module.ml_transform.arn
}

output "id" {
  #{"type":"string","default":"tfm-9432905892f259ccdddaf2df13a1f5aed8892b4b"}
  description = "Amazon Resource Name (ARN) of Glue ML Transform."
  value       = module.ml_transform.id
}

output "label_count" {
  #{"type":"number","default":"0"}
  description = "The number of labels available for this transform."
  value       = module.ml_transform.label_count
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.ml_transform.tags_all
}

output "schema" {
  #{"type":"list","default":"[]"}
  description = "Amazon Resource Name (ARN) of Glue ML Transform."
  value       = module.ml_transform.schema
}

/* output "name" {
  description = "The name of the column."
  value       = module.ml_transform.name
}

output "data_type" {
  description = "The type of data in the column."
  value       = module.ml_transform.data_type
}
 */