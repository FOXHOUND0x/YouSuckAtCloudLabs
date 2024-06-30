package main

import (
	"io/ioutil"
	"net/http"
	"os"

	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/ec2"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/vpc"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
	"github.com/pulumiverse/pulumi-doppler/sdk/go/doppler"
)

var EnvLevel = os.Getenv("ENV_LEVEL")

func credGrabber(ctx *pulumi.Context) map[string]string  {

	project := string(pulumi.String("iam-manager"))
	config := string(pulumi.String(EnvLevel))

	credentials, err := doppler.GetSecrets(ctx, &doppler.GetSecretsArgs{
		Project: &project,
		Config:  &config,
	})
	if err != nil {
		return nil
	}

	return credentials.Map
}

func getPublicIP() (string, error) {
    resp, err := http.Get("https://api.ipify.org")
    if err != nil {
        return "", err
    }
    defer resp.Body.Close()
    ip, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        return "", err
    }
    return string(ip), nil
}

func errCheck(err error) {
	if err != nil {
		panic(err)
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
		if err != nil {
			return err
		}

		allowSSH, err := ec2.NewSecurityGroup(ctx, "allowSSH", &ec2.SecurityGroupArgs{
			Name:        pulumi.String("allow-ssh"),
			Description: pulumi.String("Allow SSH inbound traffic from my IP"),
			VpcId:       pulumi.String("vpc-076c3059fe1161101"),
			Tags: pulumi.StringMap{
				"Name": pulumi.String("allow-ssh"),
			},
		}, pulumi.Provider(provider))
		errCheck(err)

		ip, err := getPublicIP()
		errCheck(err)

		ollama, err := ec2.NewInstance(ctx, "ollama", &ec2.InstanceArgs{
			Ami:                      pulumi.String("ami-03af5c83add1a2df7"),
			InstanceType:             pulumi.String("t2.micro"),
			AssociatePublicIpAddress: pulumi.Bool(false),
			VpcSecurityGroupIds: 	pulumi.StringArray{allowSSH.ID()},
			Tags: pulumi.StringMap{
				"Name": pulumi.String("ollama"),
			},
		}, pulumi.Provider(provider))
		errCheck(err)

		_, err = vpc.NewSecurityGroupIngressRule(ctx, "allow_ssh_ipv4", &vpc.SecurityGroupIngressRuleArgs{
			SecurityGroupId: allowSSH.ID(),
			CidrIpv4:        pulumi.String(ip + "/32"),
			FromPort:        pulumi.Int(22),
			ToPort:          pulumi.Int(22),
			IpProtocol:      pulumi.String("tcp"),
		}, pulumi.Provider(provider))
		errCheck(err)

		_, err = vpc.NewSecurityGroupIngressRule(ctx, "allow_all_icmp_ipv4", &vpc.SecurityGroupIngressRuleArgs{
			SecurityGroupId: allowSSH.ID(),
			CidrIpv4:        pulumi.String(ip + "/32"),
			FromPort:        pulumi.Int(0),
			ToPort:          pulumi.Int(0),
			IpProtocol:      pulumi.String("icmp"),
		}, pulumi.Provider(provider))
		errCheck(err)

		_, err = vpc.NewSecurityGroupEgressRule(ctx, "allowSSHOutbound", &vpc.SecurityGroupEgressRuleArgs{
			SecurityGroupId: allowSSH.ID(),
			CidrIpv4:        pulumi.String(ip + "/32"),
			FromPort:        pulumi.Int(22),
			ToPort:          pulumi.Int(22),
			IpProtocol:      pulumi.String("tcp"),
		}, pulumi.Provider(provider))
		errCheck(err)

		ctx.Export("amiId", ollama.Ami)
		ctx.Export("instanceType", ollama.InstanceType)
		ctx.Export("publicIp", ollama.PublicIp)


		return nil
	})
}
