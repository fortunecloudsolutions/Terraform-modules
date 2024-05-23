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
:hash: Provides a Glue ML Transform resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `name` | `string` |The name you assign to this ML Transform. It must be unique in your account.|
|:three: `input_record_tables`| `string` |The ARN of the IAM role associated with this ML Transform. |
|:four: `parameters`| `string` |The algorithmic parameters that are specific to the transform type used. Conditionally dependent on the transform type. |
|:five: `role_arn`| `string` |Path in which to create the group. |
|:six: `database_name`| `string` |A database name in the AWS Glue Data Catalog. |
|:seven: `table_name`| `string` |A table name in the AWS Glue Data Catalog. |
|:eight: `transform_type`| `string` |The type of machine learning transform. |
|:nine: `find_matches_paramater`| `string` |The parameters for the find matches algorithm.  |
|

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | test-ml-transform                                                                                |
| `role_arn`                            | arn:aws:iam::046692759124:role/service-role/AWSGlueServiceRole-test-role-glue                                                                                        |
| `role_arn`                            | [{
      "database_name":"catalog-test-database",
      "table_name":"catalog-test-table",
      "catalog_id":null,
      "connection_name":null
   }],
   "parameters":{
      "transform_type":"FIND_MATCHES",
      "find_matches_parameters":{
        "accuracy_cost_trade_off" : 0.5,
        "enforce_provided_labels" :false,
        "precision_recall_trade_off":0.5,
        "primary_key_column_name":"name"
       
      }
   }                                                                                        |



# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The group's ID |
|  :two:`arn` |The ARN aof Glue ML Transform. |
|  :three:`label_count` | The number of labels available for this transform. |
|  :four:`schema` |The object that represents the schema that this transform accepts. see Schema. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_ml_transform)
