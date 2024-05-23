#task definitions
variable "family" {
  description = "A unique name for your task definition."
  type        = string

}
variable "container_definitions" {
  description = "A list of valid container definitions provided as a single valid JSON document."
  type        = string

}
variable "task_role_arn" {
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
  type        = string
  default     = null

}
variable "execution_role_arn" {
  description = "The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
  type        = string
  default     = null

}
variable "network_mode" {
  description = " The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host."
  type        = string
  default     = null

}
variable "ipc_mode" {
  description = "The IPC resource namespace to be used for the containers in the task The valid values are host, task, and none."
  type        = string
  default     = null

}
variable "pid_mode" {
  description = "The process namespace to use for the containers in the task. The valid values are host and task."
  type        = string
  default     = null

}
variable "cpu" {
  description = "The number of cpu units used by the task. If the requires_compatibilities is FARGATE this field is required."
  type        = number
  default     = null

}
variable "memory" {
  description = "The amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
  type        = number
  default     = null

}
variable "requires_compatibilities" {
  description = " A set of launch types required by the task. The valid values are EC2 and FARGATE."
  type        = list(string)
  default     = null

}