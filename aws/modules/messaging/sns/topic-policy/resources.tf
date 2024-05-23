resource "aws_sns_topic_policy" "topic_policy" {

  arn    = var.topic_arn
  policy = var.topic_policy

}