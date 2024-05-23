variable "region" {
  description = "aws region"
  type        = string
}
variable "vault_addr" {
  description = "vault address"
  type        = string
}
variable "vault_token" {
  description = "vault token"
  type        = string
}
variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}
variable "backend" {
  description = "The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}
variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}
#IAM
variable "component" {
  description = "componenet name"
  type        = string

}
variable "deployment_identifier" {
  description = "deployment identifier"
  type        = string

}
variable "cluster_name" {
  description = "cluster name"
  type        = string

}
variable "cluster_custom_tags" {
  description = "cluster custom tags"
  type        = map(any)
}
variable "ami_name_filter" {
  description = "(optional) Used to lookup the AMI that will be used in the cluster launch template"
  type        = string
}
/*variable "linux_ami"{
  description = "linux ami lookup"
  default = "amzn2-ami-ecs-hvm-*-x86_64-ebs"
  default = "Windows_Server-2019-English-Full-ECS_Optimized*"
}*/
/*variable "os_desc" {
  description = "os description for aws windows instance"
  default = "ecs_linux"
}
variable "os_map" {
  type = map
  default = {
    "ecs_linux" = "ami-0159bf92e16d6e3ae"
    "ecs_windows" = "ami-0587770c46124f677"
  }
}
variable "cluster_instance_amis" {
  description = "A map of regions to AMIs for the container instances."
  type = map(string)

  default = {
    us-east-1 = ""
    us-east-2 = "ami-0159bf92e16d6e3ae"
    us-west-1 = ""
    us-west-2 = ""
    ap-south-1 = ""
    ap-northeast-1 = ""
    ap-northeast-2 = ""
    ap-southeast-1 = ""
    ap-southeast-2 = ""
    ca-central-1 = ""
    cn-north-1 = ""
    eu-central-1 = ""
    eu-west-1 = ""
    eu-west-2 = ""
    eu-west-3 = ""
    sa-east-1 = ""
  }
}*/
variable "cluster_instance_type" {
  description = " The size of instance to launch."
  type        = string
}
variable "key_name" {
  description = "The key name that should be used for the instance."
  type        = string
}
variable "security_group" {
  description = " A list of associated security group IDS."
  type        = list(string)

}
variable "public_ip" {
  description = "Associate a public ip address with an instance in a VPC."
  type        = bool
}
variable "block_device_size" {
  description = "The size of the volume in gigabytes."
  type        = number
}
variable "block_device_type" {
  description = "The type of volume."
  type        = string
}
#auto_scaling
variable "subnet_ids" {
  description = " A list of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside."
  type        = list(any)
}

variable "min_size" {
  description = "The minimum size of the auto scale group."
  type        = number
}
variable "max_size" {
  description = "The maximum size of the auto scale group."
  type        = number
}
variable "capacity" {
  description = " The number of Amazon EC2 instances that should be running in the group."
  type        = number
}
variable "scaling_custom_tags" {
  description = "auto-scaling tags"
  type        = map(any)

}
