# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a Target Group resource for use with Load Balancer resources.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  target_group_name | The name of the target group. If omitted, Terraform will assign a random, unique name. |
|  target_port | The port on which targets receive traffic, unless overridden when registering a specific target. |
|  target_protocol | The protocol to use for routing traffic to the targets. Should be one of 'TCP', 'TLS', 'UDP', 'TCP_UDP', 'HTTP' or 'HTTPS'. Required when target_type is instance or ip. Does not apply when target_type is lambda. |
|  target_vpc_id | The identifier of the VPC in which to create the target group. Required when target_type is instance or ip. Does not apply when target_type is lambda. |
|  deregistration_delay | The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds. |
|  slow_start | The amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. The default value is 0 seconds. |
|  load_balancing_algorithm_type | Determines how the load balancer selects targets when routing requests. Only applicable for Application Load Balancer Target Groups. The value is round_robin or least_outstanding_requests. The default is round_robin. |
|  target_type | The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address) or lambda (targets are specified by lambda arn). |
|  tags | Map of tag key and value pairs |
|  health_check_enabled | Indicates whether health checks are enabled. Defaults to true. |
|  health_check_interval | The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. For lambda target groups, it needs to be greater as the timeout of the underlying lambda |
|  health_check_path | The destination for the health check request. Applies to Application Load Balancers only (HTTP/HTTPS), not Network Load Balancers (TCP). |
|  health_check_port | The port to use to connect with the target. Valid values are either ports 1-65535, or traffic-port. Defaults to traffic-port. |
|  health_check_protocol | The protocol to use to connect with the target. Defaults to HTTP. Not applicable when target_type is lambda |
|  health_check_timeout | The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 120 seconds, and the default is 5 seconds for the instance target type and 30 seconds for the lambda target type. For Network Load Balancers, you cannot set a custom value, and the default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks. |
|  healthy_threshold  | The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 3. |
|  unhealthy_threshold | The number of consecutive health check failures required before considering the target unhealthy . For Network Load Balancers, this value must be the same as the healthy_threshold. Defaults to 3. |
|  health_check_success_resp_code | The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299'). Applies to Application Load Balancers only (HTTP/HTTPS), not Network Load Balancers (TCP). |
|  sticky_type | The type of sticky sessions. |
|  sticky_cookie_duration |  The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. |
|  sticky_enabled  | Boolean to enable / disable stickiness |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  target_arn |The ARN of the Target Group |