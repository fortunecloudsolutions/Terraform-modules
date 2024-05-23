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
|  backend |  (Required) The path the AWS secret backend is mounted at, with no leading or trailing /s. |
|  name |  The name to identify this role within the backend. Must be unique within the backend. |
|  credential_type | Specifies the type of credential to be used when retrieving credentials from the role. Must be one of iam_user, assumed_role, or federation_token. |
|  role_arns | Specifies the ARNs of the AWS roles this Vault role is allowed to assume. Required when credential_type is assumed_role and prohibited otherwise.Specifies the ARNs of the AWS roles this Vault role is allowed to assume. Required when credential_type is assumed_role and prohibited otherwise.Specifies the ARNs of the AWS roles this Vault role is allowed to assume. Required when credential_type is assumed_role and prohibited otherwise. |
|  policy_arns | Specifies a list of AWS managed policy ARNs. The behavior depends on the credential type.  |
|  iam_groups |  A list of IAM group names. IAM users generated against this vault role will be added to these IAM Groups.  |
|  default_sts_ttl | The default TTL in seconds for STS credentials. When a TTL is not specified when STS credentials are requested, and a default TTL is specified on the role, then this default TTL will be used.  |
|  max_sts_ttl | The max allowed TTL in seconds for STS credentials (credentials TTL are capped to max_sts_ttl). |

| Name | Description |
| ------------- | ------------- | 
|  role |