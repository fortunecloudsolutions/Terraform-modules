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
:hash: Manages a Glue Trigger resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `name` | `string` |The name of the trigger.|
|:three: `actions` | `string` |List of actions initiated by this trigger when it fires.|
|:four: `type` | `string` |The type of trigger. Valid values are CONDITIONAL, ON_DEMAND, and SCHEDULED.|
|:five: `conditions` | `string` |A list of the conditions that determine when the trigger will fire. See Conditions.|
|:six: `batch_size` | `string` |Number of events that must be received from Amazon EventBridge before EventBridge event trigger fires.|
|:seven: `name` | `string` |The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces.|

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | test-trigger                                                                                |
| `type`           |ON_DEMAND                                                                                       |
| `actions`             | j[{
      "arguments":{},
      "crawler_name":null,
      "job_name":"test-job",
      "timeout":1,
      "security_configuration":null,
      "notification_property":{
         "notify_delay_after":1
      }
   }],
   "timeouts": {             
      "create": "5m",
      "delete": "5m"
    }  |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | Trigger name |
|  :two:`arn` |Amazon Resource Name (ARN) of Glue Trigger |
|  :three:`tags_all` | A map of tags assigned to the resource, including those inherited from the provider  |
|  :four:`state` | The current state of the trigger.                             |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_trigger)
