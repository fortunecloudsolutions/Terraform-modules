resource "aws_s3_bucket_policy" "this" {
  count = (var.attach_elb_log_delivery_policy) ? 1 : 0

  bucket = var.bucket_name
  policy = var.attach_elb_log_delivery_policy ? data.aws_iam_policy_document.elb_log_delivery[0].json : var.policy
}

# AWS Load Balancer access log delivery policy
data "aws_elb_service_account" "this" {
  count = var.attach_elb_log_delivery_policy ? 1 : 0
}

data "aws_iam_policy_document" "elb_log_delivery" {
  count = var.attach_elb_log_delivery_policy ? 1 : 0

  statement {
    sid = ""

    principals {
      type        = "AWS"
      identifiers = data.aws_elb_service_account.this.*.arn
    }

    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
    ]
  }
}
