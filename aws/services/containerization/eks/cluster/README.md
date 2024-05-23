:warning: ***Matilda Disclaimer***
```javascript
"Matilda Software SCOPE OF LICENSE. This license applies to the Matilda cloud product. The software is licensed, not sold. This agreement only gives you some rights to use the software. 
Matilda reserves all other rights. Unless applicable law gives you more rights despite this limitation, you may use the software only as expressly permitted in this agreement. 
In doing so, you must comply with any technical limitations in the software that only allow you to use it in certain ways. 
You may not reverse engineer, decompile or disassemble the software, or otherwise attempt to derive the source code for the software except and solely to the extent required by 
third party licensing terms governing use of certain open source components that may be included in the software; remove, minimize, block or modify any notices of Matilda or its suppliers in the software; 
Use the software in any way that is against the law; share, publish, rent or lease the software, or provide the software as a offering for others to use."
```

# *Service Description*
:hash: Manages an EKS Cluster.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**                              | **Description**                                                                       |
|------------------------------------------------|---------------------------------------------------------------------------------------|
| `aws_iam_role`                                 | Provides an IAM role.                                                                 |



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | The AWS region for API calls. |
| `cluster_name` | `string` | true | The migration type. Can be one of full-load | cdc | full-load-and-cdc. |
| `cluster_iam_role_arn` | `string` | true | The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf. |
| `vpc_config` | `map` | true | Nested argument for the VPC associated with your cluster. |
| `timeouts` | `map` | true | aws_eks_cluster provides the following Timeouts configuration options. |
| `access_key` | `string` | true | The aws access keys to use to spin up the cluster. |
| `secret_key` | `string` | true | The aws secret key to use to spin up the cluster. |


# *Optional Parameters*
* `tags` : 	A map of tags to assign to the resource.
* `cluster_version` : 	Desired Kubernetes master version.
* `cluster_encryption_config` : Configuration block with encryption configuration for the cluster.
* `cluster_enabled_log_types` : A list of the desired control plane logging to enable. For more information, see Amazon EKS Control Plane Logging"
* `kubernetes_network_config` : Configuration block with kubernetes network configuration for the cluster.

# *Example Input Values*
* Input

| Input value                             | Example values                                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------|
| `region`                                | us-east-2                                                                                | 
| `cluster_name`                          | eks-cluster                                                                              | 
| `cluster_iam_role_arn`                  | ^#Cluster Role/role_arn^                                                                 | 
| `timeouts`                              | {"create":"30m","update":"60m","delete":"15m"}                                           | 



# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `cluster_arn` | The Amazon Resource Name (ARN) of the cluster.|
|  `cluster_name` | The name of the cluster. |
|  `cluster_status` | The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED. |
|  `cluster_platform_version` | The Kubernetes platform version for the cluster. |
|  `cluster_version` | The Kubernetes server version for the cluster. |
|  `cluster_certificate_authority_data` | Base64 encoded certificate data required to communicate with your cluster. |
|  `cluster_server_endpoint` | Endpoint for your Kubernetes API server. |
|  `cluster_region` | The AWS region in which the cluster is deployed. |
|  `kubeconfig` | The kubeconfig for the eks cluster |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)



