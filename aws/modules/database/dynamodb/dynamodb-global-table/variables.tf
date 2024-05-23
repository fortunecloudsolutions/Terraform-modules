variable "name" {
  type        = string
  description = "(Required) The name of the global table. Must match underlying DynamoDB Table names in all regions."
}

variable "replica" {
  type = list(object({
    region_name = string #(Required) AWS region name of replica DynamoDB Table. e.g. us-east-1

  }))

  description = "(Required) Underlying DynamoDB Table. At least 1 replica must be defined."

}