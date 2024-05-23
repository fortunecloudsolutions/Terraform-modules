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

variable "family" {
  description = "(Required) A unique name for your task definition."
  type        = string

}

variable "container_definitions" {
  description = "(Required) A list of valid container definitions provided as a single valid JSON document. Please note that you should only provide values that are part of the container definition document."
  type        = string

}

variable "cpu" {
  description = "(Optional) Number of cpu units used by the task. If the requires_compatibilities is FARGATE this field is required."
  type        = number
  default     = null

}

variable "execution_role_arn" {
  description = "(Optional) ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
  type        = string
  default     = null

}

variable "ipc_mode" {
  description = "(Optional) IPC resource namespace to be used for the containers in the task The valid values are host, task, and none"
  type        = string
  default     = null

}

variable "memory" {
  description = "(Optional) Amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
  type        = number
  default     = null

}

variable "network_mode" {
  description = "(Optional) Docker networking mode to use for the containers in the task. Valid values are none, bridge, awsvpc, and host."
  type        = string
  default     = null

}

variable "pid_mode" {
  description = "(Optional) Process namespace to use for the containers in the task. The valid values are host and task"
  type        = string
  default     = null

}

variable "requires_compatibilities" {
  description = " (Optional) Set of launch types required by the task. The valid values are EC2 and FARGATE"
  type        = list(string)
  default     = null

}

variable "tags" {
  description = " (Optional) Key-value map of resource tags."
  type        = map(any)
  default     = {}
}

variable "task_role_arn" {
  description = " (Optional) ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
  type        = string
  default     = null

}


variable "inference_accelerator" {
  description = "(Optional) Configuration block(s) with Inference Accelerators settings. Detailed below."
  type = object({
    device_name = string # (Required) Elastic Inference accelerator device name. The deviceName must also be referenced in a container definition as a ResourceRequirement.
    device_type = string # (Required) Elastic Inference accelerator type to use.
  })
  default = null
}

variable "runtime_platform" {
  description = " (Optional) Configuration block for runtime_platform that containers in your task may use."
  type = object({
    operating_system_family = string # (Optional) If the requires_compatibilities is FARGATE this field is required; must be set to a valid option from the operating system family in the runtime platform setting
    cpu_architecture        = string # (Optional) Must be set to either X86_64 or ARM64; see cpu architecture
  })
  default = null

}

variable "placement_constraints" {
  description = "(Optional) Configuration block for rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10"
  type = object({
    expression = string # (Optional) Cluster Query Language expression to apply to the constraint.
    type       = string # (Required) Type of constraint. Use memberOf to restrict selection to a group of valid candidates. Note that distinctInstance is not supported in task definitions.
  })
  default = null

}

variable "proxy_configuration" {
  description = " (Optional) Configuration block for the App Mesh proxy."
  type = object({
    container_name = string   # (Optional) Cluster Query Language expression to apply to the constraint.
    properties     = map(any) # (Required) Type of constraint. Use memberOf to restrict selection to a group of valid candidates. Note that distinctInstance is not supported in task definitions.
    type           = string   # (Optional) Proxy type. The default value is APPMESH. The only supported value is APPMESH.
  })
  default = null

}

variable "ephemeral_storage" {
  description = "(Optional) The amount of ephemeral storage to allocate for the task. This parameter is used to expand the total amount of ephemeral storage available, beyond the default amount, for tasks hosted on AWS Fargate."
  type = object({
    size_in_gib = number # (Required) The total amount, in GiB, of ephemeral storage to set for the task. The minimum supported value is 21 GiB and the maximum supported value is 200 GiB.
  })
  default = null

}

variable "volume" {
  description = "(Optional) Configuration block for volumes that containers in your task may use. "
  type = object({
    docker_volume_configuration = object({
      autoprovision = string   # (Optional) If this value is true, the Docker volume is created if it does not already exist. Note: This field is only used if the scope is shared.
      driver_opts   = map(any) # (Optional) Map of Docker driver specific options.
      driver        = string   # (Optional) Docker volume driver to use. The driver value must match the driver name provided by Docker because it is used for task placement.
      labels        = map(any) # (Optional) Map of custom metadata to add to your Docker volume.
      scope         = string   # (Optional) Scope for the Docker volume, which determines its lifecycle, either task or shared. Docker volumes that are scoped to a task are automatically provisioned when the task starts and destroyed when the task stops. Docker volumes that are scoped as shared persist after the task stops.
    })
    efs_volume_configuration = object({
      file_system_id          = string # (Required) ID of the EFS File System.
      root_directory          = string # (Optional) Directory within the Amazon EFS file system to mount as the root directory inside the host. If this parameter is omitted, the root of the Amazon EFS volume will be used. Specifying / will have the same effect as omitting this parameter. This argument is ignored when using authorization_config.
      transit_encryption      = string # (Optional) Whether or not to enable encryption for Amazon EFS data in transit between the Amazon ECS host and the Amazon EFS server. Transit encryption must be enabled if Amazon EFS IAM authorization is used. Valid values: ENABLED, DISABLED. If this parameter is omitted, the default value of DISABLED is used.
      transit_encryption_port = string # (Optional) Port to use for transit encryption. If you do not specify a transit encryption port, it will use the port selection strategy that the Amazon EFS mount helper uses.
      authorization_config = object({
        access_point_id = string # (Optional) Access point ID to use. If an access point is specified, the root directory value will be relative to the directory set for the access point. If specified, transit encryption must be enabled in the EFSVolumeConfiguration.
        iam             = string #  (Optional) Whether or not to use the Amazon ECS task IAM role defined in a task definition when mounting the Amazon EFS file system. If enabled, transit encryption must be enabled in the EFSVolumeConfiguration. Valid values: ENABLED, DISABLED. If this parameter is omitted, the default value of DISABLED is used.
      })
    })
    fsx_windows_file_server_volume_configuration = object({
      file_system_id = string # (Required) The Amazon FSx for Windows File Server file system ID to use.
      root_directory = string # (Required) The directory within the Amazon FSx for Windows File Server file system to mount as the root directory inside the host.
      authorization_config = object({
        credentials_parameter = string # (Required) The authorization credential option to use. The authorization credential options can be provided using either the Amazon Resource Name (ARN) of an AWS Secrets Manager secret or AWS Systems Manager Parameter Store parameter. The ARNs refer to the stored credentials.
        domain                = string # (Required) A fully qualified domain name hosted by an AWS Directory Service Managed Microsoft AD (Active Directory) or self-hosted AD on Amazon EC2.
      })
    })
    host_path = string # (Optional) Path on the host container instance that is presented to the container. If not set, ECS will create a nonpersistent data volume that starts empty and is deleted after the task has finished.
    name      = string # (Required) Name of the volume. This name is referenced in the sourceVolume parameter of container definition in the mountPoints section.
  })
  default = null
}