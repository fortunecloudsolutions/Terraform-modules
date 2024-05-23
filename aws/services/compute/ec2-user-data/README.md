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
:hash: Provides an EC2 instance resource. This allows instances to be created, updated, and deleted.

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
|:one: `ami` | `string` | true | AMI to use for the instance. |
|:two: `key_name` | `string` | true| Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource. |
|:three: `tags` | `map` | false | A map of tags to assign to the resource. |

# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.
* `instance_type`	: The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `lease_seconds`                             | 3600                                                                    | 
| `backend`                   | aws                                                                                 |
| `role`                        | resources|
| `region`                        | us-east-2|
| `user_data`                        | #!/bin/bash\nsudo yum install -y yum-utils\nsudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo\nyum install -y terraform|
| `user_data_ubuntu`                        |   #!/bin/bash\ncurl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -\nsudo apt-add-repository \"deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main\" -y\nsudo apt-get update -y && sudo apt-get install terraform -
|
| `user_data_rhel`                        |   #!/bin/bash\nsudo yum install -y yum-utils\nsudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo\nyum install -y terraform                                                     
|
| `user_data_windows`                        |   <powershell>\nSet-ExecutionPolicy Bypass -Scope Process -Force\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment\nEnable-WindowsOptionalFeature -online -FeatureName NetFx4Extended-ASPNET45\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-Security\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-Performance\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic\nEnable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45\n</powershell>                              
|


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`arn` | The ARN of the instance. |
|  :two:`id` |The ID of the instance. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)