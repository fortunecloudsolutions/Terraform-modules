variable "user_name" {
  description = "user name to run remote execution"
  type        = string
}
variable "host" {
  description = "host name to run remote execution"
  type        = string
}
variable "private_key" {
  description = "public key of remote execution ec2 machine"
  type        = string
}
variable "content" {
  description = "local content to be copied to remote server"
  type        = string
}
variable "destination_file" {
  description = "remote file name to run on ec2 instance"
  type        = string
}