package main

import (
	"os"

	"github.com/pulumi/pulumi-azure/sdk/v5/go/azure/core"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		template, err := os.ReadFile("./lab-template.json")
		if err != nil {
			return err
		}

		example, err := core.NewResourceGroup(ctx, "example", &core.ResourceGroupArgs{
			Name:     pulumi.String("example-resources"),
			Location: pulumi.String("West Europe"),
		})
		if err != nil {
			return err
		}

		_, err = core.NewTemplateDeployment(ctx, "exampleDeployment", &core.TemplateDeploymentArgs{
			Name:              pulumi.String("exampleDeployment"),
			ResourceGroupName: example.Name,
			DeploymentMode:    pulumi.String("Incremental"),
			TemplateBody:      pulumi.String(template),
			Parameters:        pulumi.StringMap{
				"storageAccountType": pulumi.String("Standard_LRS"),
				"storageAccountName": pulumi.String("mystorageaccount"),
				"location":           pulumi.String("US West"),
			},
		})
		if err != nil {
			return err
		}
	

		return nil
	})
}