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
:hash: Provides a Load Balancer Listener Rule resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_lb`                 | Provides a lb  resource.                                 |
| `aws_lb_listener`        | Provides a lb listener resource.                                 |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `action` | `string` | true | Configuration block for default actions.                |
| `listener_arn` | `string` | true| ARN of the load balancer.                      |
| `type` | `string` | true| Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc.                             |
| `user_pool_arn` | `string` | true| ARN of the Cognito user pool.               |
| `user_pool_client_id` | `string` | true| ID of the Cognito user pool client.                |
| `user_pool_domain` | `string` | true| Domain prefix or fully-qualified domain name of the Cognito user pool.   |
| `values` | `string` | true| Query string pairs or values to match.                           |
| `value` | `string` | true| value of query parameter.   |
| `key` | `string` | true| key of query parameter.   |
| `authorization_endpoint` | `string` | true| Authorization endpoint of the IdP. |
| `client_id` | `string` | true| OAuth 2.0 client identifier.   |
| `client_secret` | `string` | true| OAuth 2.0 client secret.    |
| `issuer` | `string` | true| OIDC issuer identifier of the IdP.    |
| `token_endpoint` | `string` | true| Token endpoint of the IdP.     |
| `user_info_endpoint` | `string` | true| User info endpoint of the IdP.     |
| `user_pool_domain` | `string` | true| The ARN of the certificate to attach to the listener.      |
| `content_type` | `string` | true| Content type. Valid values are text/plain, text/css, text/html, application/javascript and application/json.                       |
| `target_group` | `string` | true|  Set of 1-5 target group blocks. |
| `stickiness` | `string` | true| The ARN of the certificate to attach to the listener. |
| `arn` | `string` | true| ARN of the target group. |
| `duration` | `string` | true| ime period, in seconds, during which requests from a client should be routed to the same target group.                             |
| `http_header_name` | `string` | true|  Name of HTTP header to search.     |
| `status_code` | `string` | true|  The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302). |
 | `enabled` | `string` | true|  TIndicates whether target group stickiness is enabled. |




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `backend`                   | aws                                                                                 |
| `role`                   | resources                                                                                 |
| `load_balancer_arn`                   | arn:aws:elasticloadbalancing:us-east-2:046692759124:loadbalancer/app/MyFirstTerraformAppLB/1508ffe5d4fc6163                   |
| `listener_priority`                   | 100                                                                                 |
| `number_of_listener_rules`            | 1                                                                            |
| `routing_action_type`                 | forward                                                                              |
| `single_fwd_target_grp_arn`           | nuarn:aws:elasticloadbalancing:us-east-2:046692759124:targetgroup/MyFirstTerraformALBTarget/82e90157a3ae4d4cll                                                                                 |
| `condition`                           |    {
      "host_header":null,
      "http_request_method":null,
      "path_pattern":null,
      "query_string":null,
      "source_ip":null,
      "http_header":[
        {
          "http_header_name":"X-Forwarded-Port",
          "values":["20","30*"]
          }
        }                                                                                                   |

| `redirect`                         | null                                                                                |
| `fixed_response`                   | null                                                                                |
| `instaauthenticate_cognitoce_type` | null                                                                                |
| `authenticate_oidc`                | null                                                                                |




# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |

| `id` | ARN of the listener (matches arn|
| `arn` | ARN of the listener (matches id |
| `tags_all` |A map of tags assigned to the resource, including those inherited from the provider. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule#attributes-reference)