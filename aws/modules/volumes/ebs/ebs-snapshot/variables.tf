variable "volume_id" {
  description = "The list of Volume IDs of which to make a snapshot."
  type        = string
}
variable "description" {
  description = "The list of descriptions of what the snapshot is."
  type        = string
}
variable "tags" {
  description = "A list of map of tags to assign to the each snapshot"
  type        = map(string)
}