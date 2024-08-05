package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/acm"
	"github.com/pulumi/pulumi-cloudflare/sdk/v5/go/cloudflare"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func createACMCertificate(ctx *pulumi.Context) (*acm.Certificate, error) {
	cert, err := acm.NewCertificate(ctx, "ragnarCert", &acm.CertificateArgs{
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
		Name:   pulumi.Sprintf("_%s", cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordName),
		Type:   pulumi.String("CNAME"),
		Value: cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordValue().ApplyT(func(v string) *string {
			return &v
		}).(pulumi.StringPtrOutput),
		Ttl: pulumi.Int(120),
	})
	if err != nil {
		return nil, err
	}

	return cert, nil
}
