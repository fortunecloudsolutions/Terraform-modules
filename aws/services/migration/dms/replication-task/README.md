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
:hash: Provides a DMS (Data Migration Service) replication task resource. DMS replication tasks can be created, updated, deleted, and imported.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**                              | **Description**                                                                       |
|------------------------------------------------|---------------------------------------------------------------------------------------|
| `aws_dms_replication_subnet_group`             | Provides a DMS (Data Migration Service) replication subnet group resource.            |
| `aws_dms_replication_instance`                 | Provides a DMS (Data Migration Service) replication instance resource.                |
| `aws_dms_endpoint`                             | Provides a DMS (Data Migration Service) endpoint resource. DMS endpoints can be created, updated, deleted, and imported.     |

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | The AWS region for API calls. |
|:two: `migration_type` | `string` | true | The migration type. Can be one of full-load | cdc | full-load-and-cdc. |
|:three: `replication_instance_arn` | `string` | true | The Amazon Resource Name (ARN) of the replication instance. |
|:four: `replication_task_id` | `string` | true | The replication task identifier. |
|:five: `replication_task_settings` | `string` | true | An escaped JSON string that contains the task settings. |
|:six: `source_endpoint_arn` | `string` | true | The Amazon Resource Name (ARN) string that uniquely identifies the source endpoint. |
|:seven: `table_mappings` | `string` | true | An escaped JSON string that contains the table mappings. |
|:eight: `target_endpoint_arn` | `string` | true | An escaped JSON string that contains the table mappings. |
|:nine: `table_mappings` | `string` | true | The Amazon Resource Name (ARN) string that uniquely identifies the target endpoint. |


# *Optional Parameters*
* `tags` : 	A map of tags to assign to the resource.
* `replication_task_settings` : 	An escaped JSON string that contains the task settings.
* `cdc_start_time` : The Unix timestamp integer for the start of the Change Data Capture (CDC) operation.


# *Example Input Values*
* Input

| Input value                             | Example values                                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------|
| `region`                                | us-east-2                                                                                | 
| `migration_type`                        | full-load                                                                                | 
| `replication_instance_arn`              | ^#Replication Instance/replication_instance_arn^                                         | 
| `replication_task_id`                   | opsdmstask                                                                               | 
| `source_endpoint_arn`                   | ^#Source DB/source_endpoint_arn^                                                         | 
| `target_endpoint_arn`                   | ^#Target DB/target_endpoint_arn^                                                         | 
| `table_mappings`                        | {"rules":[{"rule-type":"selection","rule-id":"1","rule-name":"1","object-locator":{
"schema-name":"HR","table-name":"%"},"rule-action":"include"}]}| 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`replication_task_arn` | The Amazon Resource Name (ARN) for the replication task. |
|  :two:`replication_task_id` | The replication task identifier. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)



