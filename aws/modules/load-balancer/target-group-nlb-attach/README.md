
# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides the ability to register instances and containers with an Application Load Balancer (ALB) or Network Load Balancer (NLB) target group. For attaching resources with Elastic Load Balancer (ELB)

# Inputs
| Name | Description |
| ------------- | ------------- |
|  target_group_arn | The ARN of the target group with which to register targets |
|  instance_ip_ecscontainer_lambda_arn | The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the arn of lambda. |
|  target_port | The port on which targets receive traffic. |
|  az_ip_address | The Availability Zone where the IP address of the target is to be registered. If the private ip address is outside of the VPC scope, this value must be set to 'all'. |
|  number_of_targets | The number of instances/lambda arns/IP addresses to attach to the target |
|  target_type | The types of the target attached to the target group, allowed values are 'instance','ipaddress','lambdaarn' |

# Outputs
| Name | Description |
| ------------- | ------------- |
|  register_id |A unique identifier for the attachment |