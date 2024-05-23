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
:hash: Provides ms-active-directory

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `vpc_id` | `string` | ID od the VPC |
| `name` | `string` |name of the domain.|
| `subnet_ids` | `string` |IDs of the Subnets.|
| `password` | `string` |Password to authenticate.|
| `short_name` | `string` |short name od the corporation.|
| `dir_type` | `string` |type of the directory.|




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `lease_seconds`                   | 3600                                                                     |
| `backend`                         | aws       | 
| `role`                            | resources       | 
| `vpc_id`                          | vpc-5a863f32       | 
| `subnet_ids`                      | subnet-3145b44b,subnet-34c4ea79      | 
| `name`                            | corp2.cnet.com     | 
| `password`                        | Matri@@1234      | 
| `short_name`                      | corp                     | 
| `dir_type`                        | MicrosoftAD       | 



# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The group's ID |





# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
