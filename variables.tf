variable "aws_account_id" {
  description = "AWS account ID for which the billing alarms will be created."
  type        = string
}

variable "billing_threshold" {
  description = "Threshold for which monthly forecasted charges will trigger the metric alarm."
  type        = string
}

variable "currency" {
  description = "Currency in which the billing alarm will be triggered e.g. USD, CAD, EUR"
  type        = string
  default     = "USD"
}

variable "email" {
  type        = string
  description = "Base email for AWS notifications, gets \"+aws-billing\" appended to the username"
}



