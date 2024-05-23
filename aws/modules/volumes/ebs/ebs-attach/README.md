# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Manages a single EBS volume.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  ebs_size | The size of the drive in GiBs. |
|  device_name | The device name to expose to the instance (for example, /dev/sdh or xvdh).  |
|  availability_zone | The AZ where the EBS volume will exist. |
|  volume_name  | Volume name of ebs device |
|  instance_id | ID of the Instance to attach to |
|  volume_count | number of volumes |
|  total_count | number of volumes |
|  encrypted | If true, the disk will be encrypted. |
|  iops | The amount of IOPS to provision for the disk. Only valid for type of io1 or io2. |
|  multi_attach_enabled | Specifies whether to enable Amazon EBS Multi-Attach. Multi-Attach is supported exclusively on io1 volumes. |
|  snapshot_id | A snapshot to base the EBS volume off of. |
|  type | ) The type of EBS volume. Can be standard, gp2, io1, io2, sc1 or st1  |
|  kms_key_id | The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true. |
|  force_detach | Set to true if you want to force the volume to detach.  |
|  skip_destroy |  Set this to true if you do not wish to detach the volume from the instance to which it is attached at destroy time, and instead just remove the attachment from Terraform state. |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  volume_id |ID of the Volume |
|  instance_id |ID of the Instance |
|  device_name |The device name exposed to the instance |