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
:hash: Provides a Lambda event source mapping. This allows Lambda functions to get events from Kinesis, DynamoDB, SQS, Amazon MQ and Managed Streaming for Apache Kafka (MSK).

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_lambda_alias`     | Provides a lambda alias.                                  |
| `aws_lambda_function`     | Provides a lambda function.                                  |
| `aws_iam_role`     | Provides a iam role.                                    |



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |

| `function_name` | `string` | true| Name of the Lambda function whose resource policy you are updating. |
| `action` | `string` | true | The AWS Lambda action you want to allow in this statement. (e.g., lambda:InvokeFunction) |
| `principal` | `string` | true | The principal who is getting this permission e.g., s3.amazonaws.com, an AWS account ID, or any valid AWS service principal such as events.amazonaws.com or sns.amazonaws.com. |




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                    | 
| `principal`                       | logs.*.amazonaws.com                                                                  |
| `function_name`                   | testlambda                                                             |
| `action`                          | lambda:InvokeFunction                                                    |
| `source_arn`                      | arn:aws:logs:us-east-2:046692759124:log-group:test-cloudwatch-log-group             |



# *Verify the results in Output Section*


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission#attributes-reference)