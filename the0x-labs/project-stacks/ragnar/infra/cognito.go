package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/acm"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/cognito"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func createCognitoUserPool(ctx *pulumi.Context) (*cognito.UserPool, error) {
	userPool, err := cognito.NewUserPool(ctx, "ragnarUserPool", &cognito.UserPoolArgs{
		AutoVerifiedAttributes: pulumi.StringArray{
			pulumi.String("email"),
		},
		UsernameAttributes: pulumi.StringArray{
			pulumi.String("email"),
		},
		AdminCreateUserConfig: &cognito.UserPoolAdminCreateUserConfigArgs{
			AllowAdminCreateUserOnly: pulumi.Bool(true),
		},
	})
	if err != nil {
		return nil, err
	}

	return userPool, nil
}

func createCognitoUserPoolClient(ctx *pulumi.Context, userPool *cognito.UserPool) (*cognito.UserPoolClient, error) {
	userPoolClient, err := cognito.NewUserPoolClient(ctx, "ragnarUserPoolClient", &cognito.UserPoolClientArgs{
		UserPoolId: userPool.ID(),
		ExplicitAuthFlows: pulumi.StringArray{
			pulumi.String("ALLOW_USER_PASSWORD_AUTH"),
			pulumi.String("ALLOW_REFRESH_TOKEN_AUTH"),
		},
		GenerateSecret: pulumi.Bool(true),
	})
	if err != nil {
		return nil, err
	}

	return userPoolClient, nil
}

func createCognitoDomain(ctx *pulumi.Context, userPool *cognito.UserPool) (*cognito.UserPoolDomain, error) {
	domain, err := cognito.NewUserPoolDomain(ctx, "RagnarUserPoolDomain", &cognito.UserPoolDomainArgs{
		Domain:     pulumi.String("ragnar-cli"),
		UserPoolId: userPool.ID(),
	})
	if err != nil {
		return nil, err
	}

	_, err = acm.NewCertificate(ctx, "ragnarCliCert", &acm.CertificateArgs{
		DomainName:       pulumi.String("ragnar.cli.the0x.dev"),
		ValidationMethod: pulumi.String("DNS"),
	})
	if err != nil {
		return nil, err
	}

	_, err = cognito.NewUser(ctx, "ysacUser", &cognito.UserArgs{
		UserPoolId: userPool.ID(),
		Username:   pulumi.String("ysac@the0x.dev"),
		Attributes: pulumi.StringMap{
			"email":          pulumi.String("ysac@the0x.dev"),
			"email_verified": pulumi.String("true"),
		},
	})
	if err != nil {
		return nil, err
	}

	ctx.Export("cognitoDomain", domain.Domain)

	return domain, nil
}
