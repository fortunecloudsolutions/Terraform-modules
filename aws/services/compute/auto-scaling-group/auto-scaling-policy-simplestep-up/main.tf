provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}
provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

module "scale_up_asg_policy" {
  source                                   = "../../../../modules/auto-scaling-group/auto-scaling-policy"
  policy_name                              = var.policy_name
  autoscaling_group_name                   = var.autoscaling_group_name
  adjustment_type                          = var.adjustment_type
  policy_type                              = var.policy_type
  instance_contribute_cooldown_cloudmetric = var.instance_contribute_cooldown_cloudmetric
  min_adjustment_magnitude                 = var.min_adjustment_magnitude
  cooldown                                 = var.cooldown
  scaling_adjustment                       = var.scaling_adjustment
  metric_aggregation_type                  = var.metric_aggregation_type
  step_adjustment                          = var.step_adjustment
  predefined_metric_specification          = var.predefined_metric_specification
  customized_metric_specification          = var.customized_metric_specification

}

module "cloud_watch" {
  source                                = "../../../../modules/cloud-watch"
  cloudwatch_alarm_name                 = var.cloudwatch_alarm_name
  comparison_operator                   = var.comparison_operator
  evaluation_periods                    = var.evaluation_periods
  metric_name                           = var.metric_name
  namespace                             = var.namespace
  period                                = var.period
  statistic                             = var.statistic
  threshold                             = var.threshold
  threshold_metric_id                   = var.threshold_metric_id
  actions_enabled                       = var.actions_enabled
  alarm_actions                         = [module.scale_up_asg_policy.arn]
  alarm_description                     = var.alarm_description
  datapoints_to_alarm                   = var.datapoints_to_alarm
  dimensions                            = { AutoScalingGroupName = var.autoscaling_group_name }
  insufficient_data_actions             = var.insufficient_data_actions
  ok_actions                            = var.ok_actions
  unit                                  = var.unit
  extended_statistic                    = var.extended_statistic
  treat_missing_data                    = var.treat_missing_data
  evaluate_low_sample_count_percentiles = var.evaluate_low_sample_count_percentiles
  tags                                  = var.tags
  metric_query                          = var.metric_query

}