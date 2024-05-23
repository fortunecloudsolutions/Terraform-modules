# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a resource to create a new launch configuration, used for autoscaling groups.

# Inputs

| Name | Description |
| ------------- | ------------- |
|  name | Creates a unique name beginning with the specified prefix.  |
|  image_id | The EC2 image ID to launch. |
|  cluster_instance_type | The size of instance to launch. |
|  key_name | The key name that should be used for the instance. |
|  instance_profile | The name attribute of the IAM instance profile to associate with launched instances. |
|  user_data |  The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument |
|  security_group |  A list of associated security group IDS |
|  associate_public_ip_address | Associate a public ip address with an instance in a VPC. |
|  volume_size | The size of the volume in gigabytes. |
|  volume_type | The type of volume. Can be standard, gp2, or io1. (Default: standard). |
|  iops | The amount of provisioned IOPS. This must be set with a volume_type of io1. |
|  delete_on_termination | Whether the volume should be destroyed on instance termination |
|  encrypted | Whether the volume should be encrypted or not. |
|  vpc_classic_link_id | The ID of a ClassicLink-enabled VPC. Only applies to EC2-Classic instances. |
|  vpc_classic_link_security_groups | The IDs of one or more security groups for the specified ClassicLink-enabled VPC  |
|  enable_monitoring | Enables/disables detailed monitoring. This is enabled by default. |
|  ebs_optimized | If true, the launched EC2 instance will be EBS-optimized. |
|  spot_price | The maximum price to use for reserving spot instances. |
|  placement_tenancy | The tenancy of the instance. Valid values are default or dedicated |


# Outputs


| Name | Description |
| ------------- | ------------- |
|  launch_configuration_name |The name of the launch configuration for the ECS container instances. |