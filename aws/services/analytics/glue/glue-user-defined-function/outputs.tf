output "id" {
  #{"type":"string","default":"046692759124:catalog-test-database:test-user-defined-func"}
  description = "The id of the Glue User Defined Function."
  value       = module.user_defined_function.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:userDefinedFunction/catalog-test-database/test-user-defined-func"}
  description = "The ARN of the Glue User Defined Function."
  value       = module.user_defined_function.arn
}

output "name" {
  #{"type":"string","default":"test-user-defined-func"}
  description = "The ARN of the Glue User Defined Function."
  value       = module.user_defined_function.name
}

/* output "create_date" {
  description = "The time at which the function was created."
  value       = module.user_defined_function.create_date
}
 */