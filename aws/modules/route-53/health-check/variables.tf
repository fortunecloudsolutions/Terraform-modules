variable "reference_name" {
  type        = string
  description = "This is a reference name used in Caller Reference (helpful for identifying single health_check set amongst others)"
}

variable "endpoint" {
  type = object({
    fully_qualified_domain_name = string       # The fully qualified domain name of the endpoint to be checked.
    ip_address                  = string       # The IP address of the endpoint to be checked.
    port                        = number       # The port of the endpoint to be checked.
    failure_threshold           = number       # The number of consecutive health checks that an endpoint must pass or fail.
    request_interval            = number       # The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request.
    resource_path               = string       #  The path that you want Amazon Route 53 to request when performing health checks.
    search_string               = string       # String searched in the first 5120 bytes of the response body for check to be considered healthy. Only valid with HTTP_STR_MATCH and HTTPS_STR_MATCH
    measure_latency             = bool         # A Boolean value that indicates whether you want Route 53 to measure the latency between health checkers in multiple AWS regions and your endpoint and to display CloudWatch latency graphs in the Route 53 console.
    regions                     = list(string) # A list of AWS regions that you want Amazon Route 53 health checkers to check the specified endpoint from. 
  })
  description = "End point and the Domain name information. Only one of endpoint/calculated_health_check/cloudwatch can be entered"
}

variable "type" {
  type        = string
  description = "The protocol to use when performing health checks.Valid values are HTTP, HTTPS, HTTP_STR_MATCH, HTTPS_STR_MATCH, TCP, CALCULATED and CLOUDWATCH_METRIC."
}

variable "invert_healthcheck" {
  type        = bool
  description = "A boolean value that indicates whether the status of health check should be inverted. For example, if a health check is healthy but Inverted is True , then Route 53 considers the health check to be unhealthy."
}

variable "disabled" {
  type        = bool
  description = "A boolean value that indicates whether Route53 should send the fqdn to the endpoint when performing the health check. This defaults to AWS' defaults: when the type is 'HTTPS' enable_sni defaults to true, when type is anything else enable_sni defaults to false."
}


variable "calculated_health_check" {
  type = object({
    child_healthchecks     = list(string) # For a specified parent health check, a list of HealthCheckId values for the associated child health checks.
    child_health_threshold = number       # The minimum number of child health checks that must be healthy for Route 53 to consider the parent health check to be healthy. Valid values are integers between 0 and 256, inclusive
  })
  description = "Enter the child health check information to monitor. Only one of endpoint/calculated_health_check/cloudwatch can be entered"
}

variable "cloudwatch" {
  type = object({
    cloudwatch_alarm_name           = string # The name of the CloudWatch alarm.
    cloudwatch_alarm_region         = string # The CloudWatchRegion that the CloudWatch alarm was created in.
    insufficient_data_health_status = string # when the alarm is in insufficient state the status of the health check. Valid values are Healthy , Unhealthy and LastKnownStatus.
  })
  description = "Enter the cloud watch alarm to monitor. Only one of endpoint/calculated_health_check/cloudwatch can be entered"
}

variable "tags" {
  description = "A map of tags to assign to the zone."
  type        = map(any)
  default = {
    "Name" = "MatildaMigrationDemo"
  }
}