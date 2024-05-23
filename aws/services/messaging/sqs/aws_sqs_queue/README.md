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
:hash: Provides a SQS Queue.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|`name` | `string` | false | The name of the queue. |
|`name_prefix` | `string` | false | Creates a unique name beginning with the specified prefix. Conflicts with name. The name must consist of upper and lowercase alphanumeric characters with no spaces.|
|`visibility_timeout_seconds`| `number` | false |The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). |
|`message_retention_seconds`| `number` | false |The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days).|
|`max_message_size`| `number`| false |The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB).|
|`delay_seconds`| `number` | false |The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds.|
|`receive_wait_time_seconds`| `number` | false |The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately.|
|`policy`| `string` | false |The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide.|
|`redrive_policy`| `string` | false | The JSON policy to set up the Dead Letter Queue, see AWS docs.|
|`redrive_allow_policy`| `string` | false |  The JSON policy to set up the Dead Letter Queue redrive permission|
|`redrive_allow_policy`| `string` | false |  The JSON policy to set up the Dead Letter Queue redrive permission|
|`fifo_queue`| `bool` | false |  Boolean designating a FIFO queue. If not set, it defaults to false making it standard.|
|`content_based_deduplication`| `bool` | false | Enables content-based deduplication for FIFO queues.|
|`sqs_managed_sse_enabled`| `bool` | false | Boolean to enable server-side encryption (SSE) of message content with SQS-owned encryption keys. |
|`kms_master_key_id`| `string` | false | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. |
|`kms_data_key_reuse_period_seconds`| `string` | false |The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes). |
|`deduplication_scope`| `string` | false |Specifies whether message deduplication occurs at the message group or queue level. Valid values are messageGroup and queue (default).|
|`fifo_throughput_limit`| `string` | false |Specifies whether message deduplication occurs at the message group or queue level. Valid values are messageGroup and queue (default).|
|`tags`| `string` | false |A map of tags to assign to the queue. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.|



# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | sqs_queue_test                                                                                |
| `visibility_timeout_seconds`                            | 15                                                                                       |
| `delay_seconds`                            | 15                                                                                       |
| `max_message_size`                            | 1024                                                                                       |
| `message_retention_seconds`                            | 60                                                                                      |
# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The URL for the created Amazon SQS queue. |
|  :two:`arn` | The ARN of the SQS queue |
|  :three:`tags_all` | A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block. |
|  :four:`url` |The URL for the created Amazon SQS queue. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue)
