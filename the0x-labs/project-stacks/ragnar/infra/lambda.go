package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/iam"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/lambda"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func createLambdaFunction(ctx *pulumi.Context, role *iam.Role, bucket *s3.Bucket) (*lambda.Function, error) {
	return lambda.NewFunction(ctx, "ragnarLambda", &lambda.FunctionArgs{
		Name:    pulumi.String("ragnar-lambda"),
		Role:    role.Arn,
		Handler: pulumi.String("lambda.handler"),
		Runtime: pulumi.String("provided.al2"),
		Code:    pulumi.NewFileArchive("lambda.zip"),
		Environment: lambda.FunctionEnvironmentArgs{
			Variables: pulumi.StringMap{
				"BUCKET_NAME": bucket.ID(),
			},
		},
		Architectures: pulumi.StringArray{
			pulumi.String("x86_64"),
		},
	})
}
