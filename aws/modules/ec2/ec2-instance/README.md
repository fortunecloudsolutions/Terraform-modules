# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description

Provides an EC2 instance resource. This allows instances to be created, updated, and deleted. Instances also support provisioning.

# Inputs

| Name | Description |
| ------------- | ------------- |
|  ami | The AMI to use for the instance. |
|  instance_name | Name of the instance |
|  key_name | The key name of the instance |
|  associate_public_ip_address | Associate a public ip address with an instance in a VPC. |
|  instance_count | number of instances to create. |
|  user_data1 | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument. |
|  ebs_optimized | If true, the launched EC2 instance will be EBS-optimized. |
|  monitoring | If true, the launched EC2 instance will have detailed monitoring enabled.  |
|  get_password_data | If true, wait for password data to become available and retrieve it.  |
|  availability_zone | The AZ to start the instance in. |
|  subnet_id | The VPC Subnet ID to launch in. |
|  vpc_security_group_ids | A list of security group IDs to associate with. |
|  instance_type |  The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance. |
|  placement_group | The Placement Group to start the instance in. |
|  tenancy | The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. |
|  host_id | The Id of a dedicated host that the instance will be assigned to.  |
|  cpu_core_count | Sets the number of CPU cores for an instance.  |
|  cpu_threads_per_core |  If set to to 1, hyperthreading is disabled on the launched instance. |
|  disable_api_termination | If true, enables EC2 Instance Termination Protection |
|  instance_initiated_shutdown_behavior |  Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. |
|  private_ip | Private IP address to associate with the instance in a VPC. |
|  secondary_private_ips |  A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC.  |
|  source_dest_check | Controls if traffic is routed to the instance when the destination address does not match the instance. |
|  iam_instance_profile | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. |
|  hibernation | If true, the launched EC2 instance will support hibernation. |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  public_instance_ip |The public IP address assigned to the instance, if applicable. |
|  instance_id |The instance ID |
|  public_dns |The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
|  availability_zone |The availability zone of the instance |