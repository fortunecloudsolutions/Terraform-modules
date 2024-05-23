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
:hash: Provides the name you assign to this ML Transform. It must be unique in your account..

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `name` | `string` |Name of the metadata database where the table metadata resides. For Hive compatibility, this must be all lowercase.|
|:three: `database_name` | `string` |Name of the metadata database where the table metadata resides. For Hive compatibility, this must be all lowercase.|
|:four: `partition_values` | `string` |The values that define the partition.|
|:five: `column` | `string` |NThe name of the column.|
|:six: `sort_order` | `string` |Indicates that the column is sorted in ascending order (== 1), or in descending order (==0).|






# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `database_name`                            | catalog-test-database                                                                                |
| `table_name`           | catalog-test-table                                                                                       |
| `partition_values`             | ["Age"] |
 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The group's ID |
|  :two:`creation_time` |The time at which the partition was created. |
|  :three:`last_analysed_time` | The last time at which column statistics were computed for this partition. |
|  :three:`last_accessed_time` | The last time at which the partition was accessed. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_partition)
