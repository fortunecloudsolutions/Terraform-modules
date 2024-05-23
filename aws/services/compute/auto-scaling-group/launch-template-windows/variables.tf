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

variable "template_name" {
  type        = string
  description = "The name of the launch template. If you leave this blank, Terraform will auto-generate a unique name"
}

variable "template_description" {
  type        = string
  description = "Description of the launch template."
}

variable "block_device_mappings" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"

  type = list(object({
    device_name  = string
    no_device    = bool
    virtual_name = string
    ebs = object({
      delete_on_termination = bool
      encrypted             = bool
      iops                  = number
      kms_key_id            = string
      snapshot_id           = string
      volume_size           = number
      volume_type           = string
    })
  }))

  default = []
}

variable "credit_specification" {
  description = "Customize the credit specification of the instances. The credit option for CPU usage. Can be 'standard' or 'unlimited'. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default."

  type = object({
    cpu_credits = string
  })

  default = null
}

variable "disable_api_termination" {
  type        = bool
  description = "If `true`, enables EC2 Instance Termination Protection"
  default     = false
}

variable "ebs_optimized" {
  type        = bool
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "elastic_gpu_specifications" {
  description = "Specifications of Elastic GPU to attach to the instances"
  type = object({
    typ = string
  })
  default = null
}

variable "elastic_inference_accelerator" {
  description = "Select an elastic inference accelerator type that you want to provision along with your EC2 instance"
  type = object({
    typ = string
  })
  default = null
}

variable "iam_instance_profile_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the instance profile."
  default     = null
}

variable "iam_instance_profile_name" {
  type        = string
  description = "The name of the instance profile."
  default     = null
}

variable "image_id" {
  type        = string
  description = "The EC2 image ID to launch"
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  description = "Shutdown behavior for the instances. Can be `stop` or `terminate`"
  default     = "stop"
}

variable "instance_market_options" {
  type = object({
    market_type = string
    spot_options = object({
      block_duration_minutes         = number
      instance_interruption_behavior = string
      max_price                      = number
      spot_instance_type             = string
      valid_until                    = string
    })
  })
  description = "The market (purchasing) option for the instances"
  default     = null
}

variable "instance_type" {
  type        = string
  description = "Instance type to launch"
}

variable "kernel_id" {
  type        = string
  description = "Available operating system kernels you can use with the instance."
  default     = null
}

variable "key_name" {
  type        = string
  description = "The SSH key name that should be used for the instance"
}

variable "license_specification" {
  description = "License configurations are AWS license manager rule-sets that are associated with instances at launch to enforce license compliance. Provide the ARN of the license configuration arn"
  type = object({
    arn = string
  })
  default = null
}

variable "metadata_options" {
  description = "Customize the metadata options for the instance. http endpoint - turn off access to your instance metadata by disabling the HTTP endpoint of the instance metadata service. You can run V1 and V2, or just V2. http tokens - If you do not specify a value, the default is V1 and V2. The number of network hops that the metadata token can travel. Maximum is 64. If you do not specify a value, the default is 1."
  type = object({
    http_endpoint               = string
    http_tokens                 = string
    http_put_response_hop_limit = number
  })
  default = null
}

variable "enable_monitoring" {
  type        = bool
  description = "Enable/disable detailed monitoring"
  default     = true
}

variable "network_interfaces" {
  description = "Customize the metadata options for the instance. http endpoint - turn off access to your instance metadata by disabling the HTTP endpoint of the instance metadata service. You can run V1 and V2, or just V2. http tokens - If you do not specify a value, the default is V1 and V2. The number of network hops that the metadata token can travel. Maximum is 64. If you do not specify a value, the default is 1."
  type = object({
    ni_description              = string
    device_index                = number
    associate_public_ip_address = bool
    delete_on_termination       = bool
    security_groups             = list(string)
    subnet_id                   = string
  })
  default = null
}

variable "placement" {
  description = "The placement specifications of the instances"
  type = object({
    affinity          = string
    availability_zone = string
    group_name        = string
    host_id           = string
    tenancy           = string
  })
  default = null
}

variable "ram_disk_id" {
  type        = string
  description = "A RAM disk that contains the necessary drivers to make the chosen kernel work"
  default     = null
}

variable "vpc_security_group_ids" {
  description = " A list of security group IDs to associate with the instances"
  type        = list(string)
  default     = []
}

variable "tag_specifications" {
  description = "The tags to apply to the resources during launch. The resource types are Instances, Volumes, Elastic graphics and Spot instance requests"
  type = object({
    resource_type = string
    tags          = map(any)
  })
  default = null
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(any)
  default     = {}
}

variable "user_data_filename" {
  type        = string
  description = "The user data file name from which scripts need to be executed when launching the instances"
  default     = null
}

variable "hibernation_options" {
  description = "Hibernation stops your instance and saves the contents of the instance’s RAM to the root volume. You cannot enable hibernation after launch. If set to true, the launched EC2 instance will hibernation enabled."
  type = object({
    configured = bool
  })
  default = null
}
