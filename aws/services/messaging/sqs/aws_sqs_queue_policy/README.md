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
:hash: Allows you to set a policy of an SQS Queue while referencing ARN of the queue within the policy.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )


# *Dependencies*
| **Service Name**         | **Description**                    |
|--------------------------|------------------------------------|
| aws_sqs_queue            |  Provides a SQS Queue.             |

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `queue_url` | `string` | true | The URL of the SQS Queue to which to attach the policy |
| `policy` | `string` | true |The JSON policy for the SQS queue.|



# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `queue_url`                          | ^#SQSQueue/url                                                                               | 
| `policy`                            | {\n\"Version\": \"2008-10-17\",\n\"Id\": \"__default_policy_ID\",\n\"Statement\": \n[\n{\n \"Sid\": \"__owner_statement\",\n \"Effect\": \"Allow\",\n\"Principal\": {\n\"AWS\": \"arn:aws:iam::xxxx:root\"\n}                                                                              |




# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy)
