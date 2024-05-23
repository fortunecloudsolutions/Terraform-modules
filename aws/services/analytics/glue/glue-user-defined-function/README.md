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
:hash: Provides a Glue User Defined Function Resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `name` | `string` |The name of the function.|
|:three: `database_name` | `string` |The name of the Database to create the Function.|
|:four: `class_name` | `string` |The Java class that contains the function code.|
|:five: `owner_name` | `string` |The owner of the function.|
|:six: `owner_type` | `string` |The owner type. can be one of USER, ROLE, and GROUP.|
|:seven: `resource_type` | `string` |The type of the resource. can be one of JAR, FILE, and ARCHIVE.|



# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | test-user-defined-func                                                                                |
| `class_name`           |class                                                                                               |
| `owner_name`                  | owner                                                                                    |
| `database_name`                            | catalog-test-database                                                                                |
| `owner_type`                            |GROUP                                                                                |

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The id of the Glue User Defined Function. |
|  :two:`arn` |TThe ARN of the Glue User Defined Function. |
|  :three:`create_time` | The time at which the function was created. |
|  


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_user_defined_function)
