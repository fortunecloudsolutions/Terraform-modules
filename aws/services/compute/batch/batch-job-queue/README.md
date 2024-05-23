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
:hash: Creates a AWS Batch compute environment. Compute environments contain the Amazon ECS container instances that are used to run containerized batch jobs.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_security_group`     | Provides a security group resource.                                  |


## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `name` | `string` | true | Region-unique name for the AMI.                                                        |
| `compute_environments` | `string` | true| Required) Specifies the set of compute environments mapped to a job queue and their order. The position of the compute environments in the list will dictate the order.                  |
| `priority` | `string` | true| he priority of the job queue. Job queues with a higher priority are evaluated first when associated with the same compute environment.                         |
| `state` | `string` | true|The state of the job queue. Must be one of: ENABLED or DISABLED                   |
                                                                    



# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.
* `instance_type`	: The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `backend`                        | aws                                             |
| `role`                        | resources|
| `name`                        | test-job-queue                                                    |
| `compute_environments`                        | arn:aws:batch:us-east-2:046692759124:compute-environment/test","arn:aws:batch:us-east-2:046692759124:compute-environment/test2"]            |
| `priority`                        | 1                                            |
| `state`                        | ENABLED                                                      |
`





# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `arn` | of the compute environment. |
|  `tags_all` |A map of tags assigned to the resource, including those inherited from the provide.                  |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue#attributes-reference)