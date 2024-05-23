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
| `fargate_profile_name` | `string` | true | The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf. |
| `pod_execution_role_arn` | `map` | true | Nested argument for the VPC associated with your cluster. |
| `timeouts` | `map` | true | aws_eks_cluster provides the following Timeouts configuration options. |
| `access_key` | `string` | true | The aws access keys to use to spin up the cluster. |
| `secret_key` | `string` | true | The aws secret key to use to spin up the cluster. |
| `selectors` | `string` | true | Configuration block(s) for selecting Kubernetes Pods to execute with this EKS Fargate Profile. |
| `subnet_ids` | `string` | true | Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster). |
| `namespace` | `string` | true |  Kubernetes namespace for selection. |


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
| `region`                                | us-east-2                                                          | 
| `cluster_name`                          | eks-cluster                                                  | 
| `fargate_profile_name`                          | test-fargate                                              |
| `subnets`                          | subnet-00f135c5e2f4107fa                                                       |
| `pod_execution_role_arn`                  | arn:aws:iam::046692759124:role/eksfargatepod                        | 
| `timeouts`                              | {"create":"30m","delete":"15m"}                                           | 
| `selector`                  | [               
    {                                
      "namespace": "prod",              
      "labels": {                                            
        "app": "test",                 
        "env": "prod"                       
      }                              
    }                                     
  ],                                                                  | 






# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `arn` | Amazon Resource Name (ARN) of the EKS Fargate Profile.|
|  `id` | EKS Cluster name and EKS Fargate Profile name separated by a colon (:). |
|  `status` | Status of the EKS Fargate Profile. |
|  `tags_all` | A map of tags assigned to the resource, including those inherited from the provider. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docshttps://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_fargate_profile#attributes-reference)



