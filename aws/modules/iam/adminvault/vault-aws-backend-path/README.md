# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description


# Inputs
| Name | Description |
| ------------- | ------------- |
|  access_key | The AWS Access Key ID this backend should use to issue new credentials. |
|  secret_key | The AWS Secret Key this backend should use to issue new credentials.  |
|  region | The AWS region for API calls. |
|  path | The unique path this backend should be mounted at. Must not begin or end with a /. |
|  default_lease_seconds | The default TTL for credentials issued by this backend. |
|  max_lease_seconds | The maximum TTL that can be requested for credentials issued by this backend. |

| Name | Description |
| ------------- | ------------- |
|  backend | 