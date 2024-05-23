# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a Simple or Managed Microsoft directory in AWS Directory Service.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  name | The fully qualified name for the directory, such as corp.example.com |
|  password | The password for the directory administrator or connector user. |
|  enable_sso | Whether to enable single-sign on for the directory. Requires alias. Defaults to false. |
|  edition | The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise (applies to MicrosoftAD type only). |
|  short_name  | The short name of the directory, such as CORP. |
|  vpc_id | The identifier of the VPC that the directory is in. |
|  subnet_ids | The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs). |
|  dir_type | The directory type (SimpleAD, ADConnector or MicrosoftAD are accepted values). Defaults to SimpleAD. |
|  size | (Required for SimpleAD and ADConnector) The size of the directory (Small or Large are accepted values). |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  activedir_id |The directory identifier. |
|  access_url | The access URL for the directory, such as http://alias.awsapps.com. |
|  dns_ip_addresses |A list of IP addresses of the DNS servers for the directory or connector. |
|  security_group_id |The ID of the security group created by the directory.