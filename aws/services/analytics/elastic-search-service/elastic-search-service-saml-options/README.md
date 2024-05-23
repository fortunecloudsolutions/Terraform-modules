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
:hash: Manages SAML authentication options for an AWS Elasticsearch Domain.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | Region |
| `domain_name` | `string` |TName of the domain.|
| `enabled` | `string` |Whether advanced security is enabled.|
| `entity_id` | `string` |The unique Entity ID of the application in SAML Identity Provider.|
| `metadata_content` | `string` |The Metadata of the SAML application in xml format.|

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `domain_name`                     | test-elasticsearch-domain                                                                |
| `metadata_content`                | /home/sahithi/Desktop/iasc/iasc/terraform_cloud/aws/services/analytics/elastic-search-service/elastic-search-service-saml-options/saml-metadata.xml                                                   |
| `entity_id`                       | https://vpc-test-elasticsearch-domain-t63wtsvpfjwnmcr6756sb3zmtq.us-east-2.es.amazonaws.com                                                          |         
|`saml_options`                            | {
                                     "enabled":true,
                                     "master_backend_role":null,
                                     "master_user_name":"testuser",
                                     "roles_key":null,
                                     "session_timeout_minutes":10,
                                     "subject_key":null,                                                                                                                                                                      |                                                 





# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The name of the domain the SAML options are associated with. |




# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain_saml_options)
