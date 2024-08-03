resource "aws_sns_topic" "billing_alarm" {
    name = "ragnar-billing-alarm"
}

resource "aws_sns_topic_subscription" "billing_alarm" {
    topic_arn = aws_sns_topic.billing_alarm.arn
    protocol = "email"
    endpoint = "ysac@the0x.dev"
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
    alarm_name = "ragnar-billing-alarm"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "1"
    metric_name = "EstimatedCharges"
    namespace = "AWS/Billing"
    period = "21600"
    statistic = "Maximum"
    threshold = "10"
    alarm_description = "This metric monitors the estimated charges for the current billing period."
    alarm_actions = [aws_sns_topic.billing_alarm.arn]

    dimensions = {
        Currency = "USD"
    }
}