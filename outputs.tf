output "billing_alarm_arn" {
  description = "The ARN of the Cloudwatch billing alarm"
  value       = aws_cloudwatch_metric_alarm.billing_alarm.arn
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic for billing alarms"
  value       = aws_sns_topic.billing_alarms.arn
}