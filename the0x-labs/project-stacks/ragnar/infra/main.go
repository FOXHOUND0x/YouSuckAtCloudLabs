package main

import (
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func errorHandler(ctx *pulumi.Context, err error) error {
	if err != nil {
		return err
	}
	return nil
}

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		bucket, err := createS3Bucket(ctx)
		errorHandler(ctx, err)

		role, err := createIAMRole(ctx, bucket)
		errorHandler(ctx, err)

		_, err = createLambdaFunction(ctx, role, bucket)
		errorHandler(ctx, err)

		cert, err := createACMCertificate(ctx)
		errorHandler(ctx, err)

		_, err = createAPIGateway(ctx, cert)
		errorHandler(ctx, err)

		userPool, err := createCognitoUserPool(ctx)
		errorHandler(ctx, err)

		_, err = createCognitoUserPoolClient(ctx, userPool)
		errorHandler(ctx, err)

		_, err = createCognitoDomain(ctx, userPool)
		errorHandler(ctx, err)

		err = createBillingAlarm(ctx)
		errorHandler(ctx, err)

		return nil
	})
}
