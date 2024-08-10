package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/acm"
	"github.com/pulumi/pulumi-cloudflare/sdk/v5/go/cloudflare"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func createACMCertificate(ctx *pulumi.Context) (*acm.Certificate, error) {
	cert, err := acm.NewCertificate(ctx, "ragnarCognitoCert", &acm.CertificateArgs{
		DomainName:       pulumi.String("ragnar.the0x.dev"),
		ValidationMethod: pulumi.String("DNS"),
	})
	if err != nil {
		return nil, err
	}

	zone, err := cloudflare.LookupZone(ctx, &cloudflare.LookupZoneArgs{
		Name: pulumi.StringRef("the0x.dev"),
	})
	if err != nil {
		return nil, err
	}

	_, err = cloudflare.NewRecord(ctx, "ragnarValidationRecord", &cloudflare.RecordArgs{
		ZoneId: pulumi.String(zone.Id),
		Name:   pulumi.Sprintf("_e734927429226a143895e15c951616c5.ragnar.the0x.dev."),
		Type:   pulumi.Sprintf("CNAME"),
		Value:  pulumi.Sprintf("_075e658ab21465f74e32bf31da2c6bbf.sdgjtdhdhz.acm-validations.aws."),
		Ttl:    pulumi.Int(120),
	})
	if err != nil {
		return nil, err
	}

	_, err = cloudflare.NewRecord(ctx, "ragnarCliValidationRecord", &cloudflare.RecordArgs{
		ZoneId: pulumi.String(zone.Id),
		Name:   pulumi.Sprintf("_1bdd32b7f28c59af7e5e5a607cd8f597.ragnar.cli.the0x.dev."),
		Type:   pulumi.Sprintf("CNAME"),
		Value:  pulumi.Sprintf("_078be8fce0a82ffa4d7662c400640cb3.sdgjtdhdhz.acm-validations.aws."),
		Ttl:    pulumi.Int(120),
	})
	if err != nil {
		return nil, err
	}

	_, err = acm.NewCertificateValidation(ctx, "ragnarCertValidation", &acm.CertificateValidationArgs{
		CertificateArn: cert.Arn,
		ValidationRecordFqdns: pulumi.StringArray{
			pulumi.Sprintf("_e734927429226a143895e15c951616c5.ragnar.the0x.dev."),
		},
	})

	if err != nil {
		return nil, err
	}

	return cert, nil
}
