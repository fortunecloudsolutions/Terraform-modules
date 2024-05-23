
variable "listener_arn" {
  description = "The ARNS of the listener to which to attach the certification"
}

variable "number_of_certs_added" {
  description = "The total number of certs added for all listeners"
  type        = number

}

variable "certificate_arn" {
  description = "The certificate arns that are added to the respective listeners listed in the variable 'listener_arn'"
  type        = list(any)
}
