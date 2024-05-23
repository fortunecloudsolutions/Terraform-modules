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
:hash: Manages an EKS Node Group, which can provision and optionally update an Auto Scaling Group of Kubernetes worker nodes compatible with EKS. 

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**                              | **Description**                                                                       |
|------------------------------------------------|---------------------------------------------------------------------------------------|
| `aws_eks_cluster`                              | Manages an EKS Cluster.                                                               |
| `aws_iam_role`                                 | Provides an IAM role.                                                                 |



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | The AWS region for API calls. |
| `cluster_name` | `string` | true | Name of the EKS Cluster.|
| `node_group_name` | `string` | true | Name of the EKS Node Group. |
| `node_role_arn` | `string` | true | Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group. |
| `subnet_ids` | `list` | true | Identifiers of EC2 Subnets to associate with the EKS Node Group. |
| `scaling_config` | `map` | true | Configuration block with scaling settings. |



# *Optional Parameters*
* `tags` : 	A map of tags to assign to the resource.
* `ami_type` : 	Type of Amazon Machine Image (AMI) associated with the EKS Node Group.
* `disk_size` : Disk size in GiB for worker nodes. Defaults to 20. Terraform will only perform drift detection if a configuration value is provided.
* `force_update_version` : Force version update if existing pods are unable to be drained due to a pod disruption budget issue.
* `labels` : Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed.
* `release_version` : AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version.
* `instance_types` : List of instance types associated with the EKS Node Group.
* `launch_template` : Configuration block with Launch Template settings.
* `remote_access` : Configuration block with remote access settings.
* `kubernetes_version` : Kubernetes version. Defaults to EKS Cluster Kubernetes version. Terraform will only perform drift detection if a configuration value is provided.
* `capacity_type` : Type of capacity associated with the EKS Node Group. Defaults to ON_DEMAND. Valid values: ON_DEMAND, SPOT.

# *Example Input Values*
* Input

| Input value                             | Example values                                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------|
| `region`                                | us-east-2                                                                                | 
| `cluster_name`                          | ^#EKS Cluster/cluster_name^                                                              | 
| `node_group_name`                       | ng-eks-new                                                                               | 
| `node_role_arn`                         | ^#Node Group Role/role_arn^                                                              | 
| `subnet_ids`                            | ["subnet-811dd0fc","subnet-6aa33401","subnet-ae89bce2"]                                  | 
| `ami_type`                              | AL2_x86_64                                                                               | 
| `disk_size`                             | 40                                                                                       | 
| `force_update_version`                  | false                                                                                    | 
| `instance_types`                        | ["t3.medium"]                                                                            | 
| `scaling_config`                        | {"desired_size":"1","min_size":"1","max_size":"1"}                                       |
| `remote_access`                         | {"ec2_ssh_key":"xxx","source_security_group_ids":["sg-7839d232"]}                        |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `nodegroup_arn` | Amazon Resource Name (ARN) of the EKS Node Group.|
|  `nodegroup_id` | Amazon Resource Name (ARN) of the EKS Node Group. |
|  `nodegroup_status` | Status of the EKS Node Group. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group)



