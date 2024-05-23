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
:hash: Provides a Redshift Cluster Resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `cluster_identifier` | `string` |The Cluster Identifier. Must be a lower case string.|
|:three: `node_type` | `string` |The node type to be provisioned for the cluster.|
|:four: `master_username` | `string` |Username for the master DB user.|
|:five: `master_password` | `string` |Password for the master DB user.|
|:six: `enable` | `string` |Enables logging information such as queries and connection attempts, for the specified Amazon Redshift cluster.|
|:seven: `destination_region` | `string` |The destination region that you want to copy snapshots to.|


# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `cluster_identifier`                            | test-cluster                                                                     |
| `node_type`     | dc2.large      |      

| `master_password`     | Awsuser15      |   

| `master_username`     | awsuser      |   

| `skip_final_snapshot`     | :true       |   

 

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The Redshift Cluster ID.|
|  :two:`arn` |Amazon Resource Name (ARN) of cluster |
|  :three:`cluster_identifier` | The Cluster Identifier. |

|  :four:`cluster_type` | The cluster type|
|  :five:`node_type` | The type of nodes in the cluster |
|  :six:`database_name` | The name of the default database in the Cluster |
|  :seven:`availability_zone` | The availability zone of the Cluster |
|  :eight:`automated_snapshot_retention_period` | The backup retention period |
|  :nine:`preferred_maintenance_window` | The backup window |
|  :ten:`cluster_security_groups` | The security groups associated with the cluster |
|  :eleven:`vpc_security_group_ids` | The VPC security group Ids associated with the cluster |
|  :twelve:`dns_name` | The DNS name of the cluster |
|  :thirteen:`port` | The Port the cluster responds on |
|  :fourteen:`cluster_version` | The version of Redshift engine software |
|  :fifteen:`cluster_parameter_group_name` | The name of the parameter group to be associated with this cluster |
|  :sixteen:`cluster_subnet_group_name` | The name of a cluster subnet group to be associated with this cluster |
|  :seventeen:`cluster_public_key` | The public key for the cluster |
|  :eighteen:`cluster_revision_number` | The specific revision number of the database in the cluster |
|  :nineteen:`tags_all` | A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block. |








# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_cluster#attributes-reference
