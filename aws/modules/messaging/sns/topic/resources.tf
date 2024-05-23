resource "aws_sns_topic" "topic" {

  name              = var.name
  display_name      = var.display_name
  policy            = var.policy
  delivery_policy   = var.delivery_policy_https
  kms_master_key_id = var.kms_master_key_id

  application_success_feedback_role_arn    = var.app_status_logging != null ? lookup(var.app_status_logging, "success_feedback_role_arn") : null
  application_success_feedback_sample_rate = var.app_status_logging != null ? lookup(var.app_status_logging, "success_feedback_sample_rate") : null
  application_failure_feedback_role_arn    = var.app_status_logging != null ? lookup(var.app_status_logging, "failure_feedback_role_arn") : null

  http_success_feedback_role_arn    = var.http_status_logging != null ? lookup(var.http_status_logging, "success_feedback_role_arn") : null
  http_success_feedback_sample_rate = var.http_status_logging != null ? lookup(var.http_status_logging, "success_feedback_sample_rate") : null
  http_failure_feedback_role_arn    = var.http_status_logging != null ? lookup(var.http_status_logging, "failure_feedback_role_arn") : null

  lambda_success_feedback_role_arn    = var.lambda_status_logging != null ? lookup(var.lambda_status_logging, "success_feedback_role_arn") : null
  lambda_success_feedback_sample_rate = var.lambda_status_logging != null ? lookup(var.lambda_status_logging, "success_feedback_sample_rate") : null
  lambda_failure_feedback_role_arn    = var.lambda_status_logging != null ? lookup(var.lambda_status_logging, "failure_feedback_role_arn") : null

  sqs_success_feedback_role_arn    = var.sqs_status_logging != null ? lookup(var.sqs_status_logging, "success_feedback_role_arn") : null
  sqs_success_feedback_sample_rate = var.sqs_status_logging != null ? lookup(var.sqs_status_logging, "success_feedback_sample_rate") : null
  sqs_failure_feedback_role_arn    = var.sqs_status_logging != null ? lookup(var.sqs_status_logging, "failure_feedback_role_arn") : null

  tags = var.tags

}