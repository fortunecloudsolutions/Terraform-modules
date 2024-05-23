# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a Load Balancer resource.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  nlb_name | The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with |
|  nlb_internal |  If true, the LB will be internal. |
|  enable_nlb_delete_via_awsapi | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. |
|  enable_nlb_cross_zone_load_balancing | If true, cross-zone load balancing of the load balancer will be enabled. This is a network load balancer feature. Defaults to false. |
|  ip_address_type | The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack |
|  tags | A map of tags to assign to the resource |
|  access_log_bucket_name | The S3 bucket name to store the logs in |
|  enable_access_logs | Boolean to enable / disable access_logs |
|  attach_nlb_subnet_ids | The id of the subnet of which to attach to the load balancer. You can specify only one subnet per Availability Zone. |
|  eip_alloc_ids  | The allocation ID of the Elastic IP address |
|  private_ip4_for_internal_nlb | A private ipv4 address within the subnet to assign to the internal-facing load balancer |


# Outputs


| Name | Description |
| ------------- | ------------- |
|  nlb_arn |The ARN of the Application load balancer |
|  nlb_dns_name |The DNS name of the Network load balancer |