
variable "replication_configuration" {
  type = object({
    rule = object({
      destination = list(object({
        region      = string #(Required) A Region to replicate to.
        registry_id = string #(Required) The account ID of the destination registry to replicate to.

      }))
    })
  })
  description = "(Required) Replication configuration for a registry."
}

