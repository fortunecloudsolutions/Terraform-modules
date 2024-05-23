:warning: ***Matilda Disclaimer***
```javascript
"Matilda Software SCOPE OF LICENSE. This license applies to the Matilda cloud product. The software is licensed, not sold. This agreement only gives you some rights to use the software. 
Matilda reserves all other rights. Unless applicable law gives you more rights despite this limitation, you may use the software only as expressly permitted in this agreement. 
In doing so, you must comply with any technical limitations in the software that only allow you to use it in certain ways. 
You may not reverse engineer, decompile or disassemble the software, or otherwise attempt to derive the source code for the software except and solely to the extent required by 
third party licensing terms governing use of certain open source components that may be included in the software; remove, minimize, block or modify any notices of Matilda or its suppliers in the software. 
Use the software in any way that is against the law; share, publish, rent or lease the software, or provide the software as a offering for others to use."
```

# *Service Description*
:hash: Provides a S3 bucket resource.
# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_security_group`     | Provides a security group resource.                                  |
| `aws_s3_bucket_acl`      | Provides a aws_s3_bucket_acl resource.                               |



# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `allowed_methods` | `string` | true | One or more HTTP methods that you allow the origin to execute. Can be GET, PUT, POST, DELETE or HEAD. |
| `allowed_origins ` | `string` | true | One or more origins you want customers to be able to access the bucket from. |
| `type` | `string` | true | Type of grantee to apply for. Valid values are CanonicalUser and Group. AmazonCustomerByEmail is not supported.  |
| `enabled` | `string` | true | Specifies lifecycle rule status. |
| `storage_class` | `string` | true |Specifies the Amazon S3 storage class to which you want the object to transition. |
| `days` | `string` | true | Specifies the number of days noncurrent object versions expire. |
| `target_bucket` | `string` | true | The name of the bucket that will receive the log objects. |
| `default_retention` | `string` | true | The default retention period that you want to apply to new objects placed in this bucket . |
| `mode` | `string` | true | The default Object Lock retention mode you want to apply to new objects placed in this bucket. Valid values are GOVERNANCE and COMPLIANCE. |
| `role` | `string` | true | The ARN of the IAM role for Amazon S3 to assume when replicating the objects. |
| `rules` | `string` | true | Specifies the rules managing the replication. |
| `destination` | `string` | true | Specifies the destination for the rule. |
| `bucket` | `string` | true | The ARN of the S3 bucket where you want Amazon S3 to store replicas of the object identified by the rule. |
| `sse_algorithm` | `string` | true | The server-side encryption algorithm to use. Valid values are AES256 and aws:kms. |
| `rule` | `string` | true | A single object for server-side encryption by default configuration. |
| `index_document ` | `string` | true |  Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders. |


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `bucket_name`                   | citizen-unike-bocket                                                     |
| `role`                   | resources                                                                                |
| `target_prefix`                   | log/                                                                     |
| `sse_algorithm`                   | sAES256                                                                      |
| `security_groups`                   | sg-8ab03be1                                                              |
| `block_public_acls`                   | true                                                                                |
| `block_public_policy`                   | true                                                                                |
| `ignore_public_acls`                   | true                                                                                |
| `restrict_public_buckets`                   | true                                                             |
| `id`                   | log1                                                                                |
| `enabled`                   | true                                                                                |
| `prefix`                   | log1/                                                                                |
| `rolabort_incomplete_multipart_upload_dayse`                   | 7                                                           |
| `noncurrent_version_transition`                   | resources                                                    |
| `acl`                   | resources                                                                                |
| `force_destroy`                   | resources                                                                                |
| `attach_policy`                   | resources                                                                                |
| `versioning`                   | {
    "enabled":false
  }                                                                                |
  
| `website`                   | {
    "index_document": "index.html",
    "error_document": "error.html"                                                  |
| `cors_rule`                   | [
    {
      "allowed_methods": ["PUT", "POST"],
      "allowed_origins": ["https://hashicorp.io", "https://test.hashicorp.io"],
      "allowed_headers": ["*"],
      "expose_headers":   ["ETag"],
      "max_age_seconds": 3000
      }, {
      "allowed_methods": ["PUT"],
      "allowed_origins": ["https://cnet.com"],
      "allowed_headers": ["*"],
      "expose_headers": ["ETag"],
      "max_age_seconds":3000
    }
  ]                                                                                |
| `lifecycle_rule`                   | [
    {
      "id"      : "log",
      "enabled": true,
      "prefix": "log/",

      "tags": {
        "rule": "log",
        "autoclean": "true"
      },

      "transition": [
        {
          "days" :          30,
          "storage_class": "ONEZONE_IA"
          }, {
          "days" :         60,
          "storage_class": "GLACIER"
        }
      ],

      "expiration": {
        "days": 90
      },

      "noncurrent_version_expiration": {
        "days": 30
      }
    },
      {
         "id": "log1",
         "enabled": true,
         "prefix": "log1/",
         "abort_incomplete_multipart_upload_days": 7,
         "noncurrent_version_transition": [
            {
               "days": 30,
               "storage_class": "STANDARD_IA"
            },
            {
               "days": 60,
               "storage_class": "ONEZONE_IA"
            },
            {
               "days": 90,
               "storage_class": "GLACIER"
            }
         ],
         "noncurrent_version_expiration": {
            "days": 300
         }
      }
  ]                                                                                |
  | `actions`                   | [
      "s3:ListBucket"
    ], |
    | `role_policy`                   | {\n\"Version\": \"2012-10-17\",\n\"Statement\": [\n{\n\"Action\": \"sts:AssumeRole\",\n\"Principal\": {\n\"Service\": \"datasync.amazonaws.com\"\n},\n\"Effect\": \"Allow\",\"Sid\": \"\"\n}\n  ]\n}                                                                                |  
                                                                                




# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `arn` | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| `bucket_domain_name ` | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| `id` |The name of the bucket. |
| `bucket_regional_domain_name` |The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. |
| `hosted_zone_id` | The Route 53 Hosted Zone ID for this bucket's region. |
| `region ` |The AWS region this bucket resides in. |
| `website_endpoint` |The website endpoint, if the bucket is configured with a website. If not, this will be an empty string..|
| `website_domain` | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. |
| `tags_All` | A map of tags assigned to the resource, including those inherited from the provider. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fsx_windows_file_system#domain_name)