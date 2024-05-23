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
:hash: Provides a Glue Schema resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `schema_name` | `string` |The Name of the schema.|
|:three: `registry_arn` | `string` |The ARN of the Glue Registry to create the schema in.|
|:four: `data_format` | `string` |The data format of the schema definition. Valid values are AVRO, JSON and PROTOBUF.|
|:five: `compatibility` | `string` |TThe compatibility mode of the schema. Values values are: NONE, DISABLED, BACKWARD, BACKWARD_ALL, FORWARD, FORWARD_ALL, FULL, and FULL_ALL.|
|:six: `schema_definition` | `string` |TThe schema definition using the data_format setting for schema_name.|


# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `registry_arn`                    | arn:aws:glue:us-east-2:046692759124:registry/test-registry                               |
| `schema_name`                     | test-schema                                                                              |
| `data_format`                     | AVRO                                                                                     |
| `compatibility`                   | NONE                                                                                     |
| `schema_definition`               | "{\"type\":\"record\",\"namespace\":\"ABC_Organization\",\"name\":\"Employee\",\"fields\":[{\"name\":\"Name\",\"type\":\"string\"},{\"name\":\"Age\",\"type\":\"int\"}]}                                                                                                            |

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The group's ID |
|  :two:`arn` |The ARN assigned by AWS for this group |
|  :three:`registry_name` | The name of the Glue Registry. |
|  :four:`latest_schema_version` | The latest version of the schema associated with the returned schema definition. |
|  :five:`next_schema_version` | The next version of the schema associated with the returned schema definition. |
|  :six:`schema_checkpoint` | The version number of the checkpoint (the last time the compatibility mode was changed). |
|  :seven:`tags_all` | A map of tags assigned to the resource, including those inherited from the provider |  


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_schema#argument-reference)
