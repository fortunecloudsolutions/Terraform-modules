variable "db_instance_identifier" {
  description = "The DB Instance Identifier from which to take the snapshot."
  type        = list(any)
}
variable "db_snapshot_identifier" {
  description = "The Identifier for the snapshot."
  type        = string
}
variable "tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
}
