# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Generates a secure private key and encodes it as PEM. This resource is primarily intended for easily bootstrapping throwaway development environments.

# Inputs

| Name | Description |
| ------------- | ------------- |
|  create_key_pair |Controls if key pair should be created |
|  key_name |The name for the key pair. |
|  algorithm |The name of the algorithm to use for the key. Currently-supported values are RSA and ECDSA.  |
|  rsa_bits | When algorithm is RSA, the size of the generated RSA key in bits. Defaults to 2048. |
|  edsa_curve |When algorithm is ECDSA, the name of the elliptic curve to use.  |
|  file_permission |The permission to set for any directories created. Expects a string. |



# Outputs


| Name | Description |
| ------------- | ------------- |
|  key_name |The key pair name. |