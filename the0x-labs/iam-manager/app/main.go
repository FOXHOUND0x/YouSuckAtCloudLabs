package main

import (
	"fmt"

	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/iam"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
	"github.com/pulumiverse/pulumi-doppler/sdk/go/doppler"
)

func credGrabber(ctx *pulumi.Context) map[string]string  {

	project := string(pulumi.String("iam-manager"))
	config := string(pulumi.String("dev"))

	credentials, err := doppler.GetSecrets(ctx, &doppler.GetSecretsArgs{
		Project: &project,
		Config:  &config,
	})
	if err != nil {
		return nil
	}

	fmt.Println("AWS_ACCESS_KEY_ID: ", "********")
	fmt.Println("AWS_SECRET_ACCESS_KEY: ", "********")
	return credentials.Map
}

func errChk(err error) {
	if err != nil {
		fmt.Println(err)
	}
}

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {

		creds := credGrabber(ctx)
		if creds == nil {
			return nil
		}

		provider, err := aws.NewProvider(ctx, "aws", &aws.ProviderArgs{
			Region: pulumi.String("us-west-2"),
			AccessKey: pulumi.String(creds["AWS_ACCESS_KEY_ID"]),
			SecretKey: pulumi.String(creds["AWS_SECRET_ACCESS_KEY"]),
		})
		errChk(err)

		user, err := iam.NewUser(ctx, "bedrock-user", &iam.UserArgs{
			Path: pulumi.String("/"),
		}, pulumi.Provider(provider))
		errChk(err)

		accessKey, err := iam.NewAccessKey(ctx, "bedrock-access-key", &iam.AccessKeyArgs{
			User: user.Name,
		}, pulumi.Provider(provider))
		errChk(err)

		_, err = doppler.NewSecret(ctx, "bedrock-secret-key", &doppler.SecretArgs{
			Project: pulumi.String("iam-manager"),
			Config:  pulumi.String("dev"),
			Value:   accessKey.Secret,
		})

		_, err = doppler.NewSecret(ctx, "bedrock-access-key", &doppler.SecretArgs{
			Project: pulumi.String("iam-manager"),
			Config:  pulumi.String("dev"),
			Value:   accessKey.ID(),
		})

		_, err = doppler.NewServiceToken(ctx, "bedrock-service-token", &doppler.ServiceTokenArgs{
			Project: pulumi.String("iam-manager"),
			Config:  pulumi.String("dev"),
			Access:  pulumi.String("read"),
			Name:    pulumi.String("bedrock-service-token"),
		})

		ctx.Export("AccessKey:", accessKey.ID())
		ctx.Export("SecretKey:", accessKey.Secret)
		ctx.Export("UserName:", user.Name)
		return nil
	})
}