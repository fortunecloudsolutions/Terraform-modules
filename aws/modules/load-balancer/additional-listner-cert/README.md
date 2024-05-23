
# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a Load Balancer Listener Certificate resource.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  listener_arn | The ARNS of the listener to which to attach the certification |
|  number_of_certs_added | The total number of certs added for all listeners |
|  certificate_arn | The certificate arns that are added to the respective listeners listed in the variable 'listener_arn' |