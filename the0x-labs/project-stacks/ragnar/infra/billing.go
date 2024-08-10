package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/cloudwatch"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/sns"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func createBillingAlarm(ctx *pulumi.Context) error {
	topic, err := sns.NewTopic(ctx, "ragnarBillingAlarm", &sns.TopicArgs{
		Name: pulumi.String("ragnar-billing-alarm"),
	})
	if err != nil {
		return err
	}

	_, err = sns.NewTopicSubscription(ctx, "ragnarBillingAlarmSubscription", &sns.TopicSubscriptionArgs{
		Topic:    topic.Arn,
		Protocol: pulumi.String("email"),
		Endpoint: pulumi.String("ysac@the0x.dev"),
	})
	if err != nil {
		return err
	}

	_, err = cloudwatch.NewMetricAlarm(ctx, "ragnarBillingAlarm", &cloudwatch.MetricAlarmArgs{
		Name:               pulumi.String("ragnar-billing-alarm"),
		ComparisonOperator: pulumi.String("GreaterThanOrEqualToThreshold"),
		EvaluationPeriods:  pulumi.Int(1),
		MetricName:         pulumi.String("EstimatedCharges"),
		Namespace:          pulumi.String("AWS/Billing"),
		Period:             pulumi.Int(21600),
		Statistic:          pulumi.String("Maximum"),
		Threshold:          pulumi.Float64(10),
		AlarmDescription:   pulumi.String("This metric monitors the estimated charges for the current billing period."),
		ActionsEnabled:     pulumi.Bool(true),
		AlarmActions: pulumi.Array{
			topic.Arn,
		},
		Dimensions: pulumi.StringMap{
			"Currency": pulumi.String("USD"),
		},
	})
	if err != nil {
		return err
	}

	return nil
}
