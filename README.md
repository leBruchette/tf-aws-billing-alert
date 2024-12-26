# tf-aws-billing-alert

This Terraform module sets up AWS billing alarms using CloudWatch and SNS. 
It helps you monitor your AWS spending by sending notifications via email when your forecasted charges exceed a specified threshold.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.billing_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sns_topic.billing_alarms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.email_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID for which the billing alarms will be created. | `string` | n/a | yes |
| <a name="input_billing_threshold"></a> [billing\_threshold](#input\_billing\_threshold) | Threshold for which monthly forecasted charges will trigger the metric alarm. | `string` | n/a | yes |
| <a name="input_currency"></a> [currency](#input\_currency) | Currency in which the billing alarm will be triggered e.g. USD, CAD, EUR | `string` | `"USD"` | no |
| <a name="input_email"></a> [email](#input\_email) | Base email for AWS notifications, gets "+aws-billing" appended to the username | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_alarm_arn"></a> [billing\_alarm\_arn](#output\_billing\_alarm\_arn) | The ARN of the Cloudwatch billing alarm |
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | The ARN of the SNS topic for billing alarms |
<!-- END_TF_DOCS -->