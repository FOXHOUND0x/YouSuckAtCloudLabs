package main

import (
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		// S3 Bucket
		bucket, err := createS3Bucket(ctx)
		if err != nil {
			return err
		}

		// IAM Role
		role, err := createIAMRole(ctx, bucket)
		if err != nil {
			return err
		}

		// Lambda Function
		_, err = createLambdaFunction(ctx, role, bucket)
		if err != nil {
			return err
		}

		// ACM Certificate
		cert, err := createACMCertificate(ctx)
		if err != nil {
			return err
		}

		// API Gateway
		_, err = createAPIGateway(ctx, cert)
		if err != nil {
			return err
		}

		// Billing Alarm
		err = createBillingAlarm(ctx)
		if err != nil {
			return err
		}

		return nil
	})
}
