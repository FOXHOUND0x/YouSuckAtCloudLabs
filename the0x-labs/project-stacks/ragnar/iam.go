package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/iam"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func createIAMRole(ctx *pulumi.Context, bucket *s3.Bucket) (*iam.Role, error) {
	role, err := iam.NewRole(ctx, "ragnarLambdaRole", &iam.RoleArgs{
		AssumeRolePolicy: pulumi.String(`{
            "Version": "2012-10-17",
            "Statement": [{
                "Action": "sts:AssumeRole",
                "Effect": "Allow",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                }
            }]
        }`),
	})
	if err != nil {
		return nil, err
	}

	_, err = iam.NewRolePolicyAttachment(ctx, "lambdaBasicExecution", &iam.RolePolicyAttachmentArgs{
		Role:      role.Name,
		PolicyArn: pulumi.String("arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"),
	})
	if err != nil {
		return nil, err
	}

	_, err = iam.NewRolePolicy(ctx, "ragnarLambdaPolicy", &iam.RolePolicyArgs{
		Role: role.ID(),
		Policy: pulumi.All(bucket.Arn).ApplyT(func(args []interface{}) (interface{}, error) {
			bucketArn := args[0].(string)
			return pulumi.Sprintf(`{
                "Version": "2012-10-17",
                "Statement": [{
                    "Action": [
                        "s3:GetObject",
                        "s3:PutObject",
                        "s3:ListBucket"
                    ],
                    "Effect": "Allow",
                    "Resource": [
                        "%s/*",
                        "%s"
                    ]
                }]
            }`, bucketArn, bucketArn), nil
		}).(pulumi.StringOutput),
	})
	if err != nil {
		return nil, err
	}
	return role, nil
}
