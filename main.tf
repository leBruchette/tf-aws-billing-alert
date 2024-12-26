locals {
  email_parts = regex("^(.*)@(.*)$", var.email)
  billing_email = format("%s+aws-billing@%s", local.email_parts[0], local.email_parts[1])

  alarm = {
    name        = "billing-alarm-${var.billing_threshold}-${lower(var.currency)}"
    description = "Forecasted bill for ${var.aws_account_id} >= ${var.billing_threshold} ${var.currency}"
  }

}

resource "aws_sns_topic" "billing_alarms" {
  name = local.alarm.name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.billing_alarms.arn
  protocol  = "email"
  endpoint  = local.billing_email
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name          = local.alarm.name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "28800"
  statistic           = "Maximum"
  threshold           = var.billing_threshold
  alarm_description   = "Alarm triggers when forecasted billing reaches ${var.billing_threshold} ${var.currency}."
  actions_enabled     = true
  alarm_actions = [aws_sns_topic.billing_alarms.arn]

  dimensions = {
    Currency = var.currency
  }
}

