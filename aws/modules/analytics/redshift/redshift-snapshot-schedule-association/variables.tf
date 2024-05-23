variable "cluster_identifier" {
  type        = string
  description = "(Required, Forces new resource) The cluster identifier."
}

variable "schedule_identifier" {
  type        = string
  description = "(Required, Forces new resource) The snapshot schedule identifier."
}