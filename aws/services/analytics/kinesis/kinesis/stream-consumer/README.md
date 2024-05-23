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
:hash: aws_kinesis_stream_consumer.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | Region |
| `name` | `string` |The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces.|
| `stream_mode` | `string` |Specifies the capacity mode of the stream. Must be either PROVISIONED or ON_DEMAND.|


# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | test-stream-consumer                                                                     |
| `stream_arn`     | arn:aws:kinesis:us-east-2:046692759124:stream/test-kinesis-stream       |                                  

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `id` | The group's ID |
|  `arn` |The ARN assigned by AWS for this group |
|  `creation_time_stamp` | Approximate timestamp in RFC3339 format of when the stream consumer was created. |




# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream_consumer)
