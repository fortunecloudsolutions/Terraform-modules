variable "compute_environment_name" {
  type        = string
  description = "(Optional, Forces new resource) The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, and underscores are allowed. If omitted, Terraform will assign a random, unique name."
  default     = null
}

variable "compute_environment_name_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique compute environment name beginning with the specified prefix. Conflicts with compute_environment_name."
  default     = null
}

variable "service_role" {
  type        = string
  description = "(Required) The full Amazon Resource Name (ARN) of the IAM role that allows AWS Batch to make calls to other AWS services on your behalf."
}

variable "state" {
  type        = string
  description = "(Optional) The state of the compute environment. If the state is ENABLED, then the compute environment accepts jobs from a queue and can scale out automatically based on queues. Valid items are ENABLED or DISABLED. Defaults to ENABLED."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}

variable "type" {
  type        = string
  description = "(Required) The type of the compute environment. Valid items are MANAGED or UNMANAGED."
}

variable "compute_resources" {
  type = object({
    allocation_strategy = string       #(Optional) The allocation strategy to use for the compute resource in case not enough instances of the best fitting instance type can be allocated. Valid items are BEST_FIT_PROGRESSIVE, SPOT_CAPACITY_OPTIMIZED or BEST_FIT. Defaults to BEST_FIT.
    bid_percentage      = number       #(Optional) Integer of maximum percentage that a Spot Instance price can be when compared with the On-Demand price for that instance type before instances are launched. For example, if your bid percentage is 20% (20), then the Spot price must be below 20% of the current On-Demand price for that EC2 instance. If you leave this field empty, the default value is 100% of the On-Demand price. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    desired_vcpus       = number       #(Optional) The desired number of EC2 vCPUS in the compute environment. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    image_id            = string       #(Optional) The Amazon Machine Image (AMI) ID used for instances launched in the compute environment. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified. (Deprecated, use image_id_override instead)
    ec2_key_pair        = string       #(Optional) The EC2 key pair that is used for instances launched in the compute environment. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    instance_role       = string       #(Optional) The Amazon ECS instance role applied to Amazon EC2 instances in a compute environment. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    instance_type       = list(string) #(Optional) A list of instance types that may be launched. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    max_vcpus           = number       #(Required) The maximum number of EC2 vCPUs that an environment can reach.
    min_vcpus           = number       #(Optional) The minimum number of EC2 vCPUs that an environment should maintain. For EC2 or SPOT compute environments, if the parameter is not explicitly defined, a 0 default value will be set. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    security_group_ids  = list(string) #(Required) A list of EC2 security group that are associated with instances launched in the compute environment.
    spot_iam_fleet_role = string       #(Optional) The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute environment. This parameter is required for SPOT compute environments. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    subnets             = list(string) #(Required) A list of VPC subnets into which the compute resources are launched.
    tags                = map(string)  #(Optional) Key-value pair tags to be applied to resources that are launched in the compute environment. This parameter isn't applicable to jobs running on Fargate resources, and shouldn't be specified.
    type                = string       #(Required) The type of compute environment. Valid items are EC2, SPOT, FARGATE or FARGATE_SPOT.  

    ec2_configuration = object({
      image_id_override = string #(Optional) The AMI ID used for instances launched in the compute environment that match the image type. This setting overrides the image_id argument in the `compute_resources block.
      image_type        = string # (Optional) The image type to match with the instance type to select an AMI. If the image_id_override parameter isn't specified, then a recent Amazon ECS-optimized Amazon Linux 2 AMI (ECS_AL2) is used.

    })
    launch_template = object({
      launch_template_id   = string #(Optional) The AMI ID used for instances launched in the compute environment that match the image type. This setting overrides the image_id argument in the `compute_resources block.
      launch_template_name = string # (Optional) The image type to match with the instance type to select an AMI. If the image_id_override parameter isn't specified, then a recent Amazon ECS-optimized Amazon Linux 2 AMI (ECS_AL2) is used.
      version              = string #(Optional) The version number of the launch template. Default: The default version of the launch template.
    })
  })
  description = "(Optional) Details of the compute resources managed by the compute environment. This parameter is required for managed compute environments. See details below."
  default     = null
}