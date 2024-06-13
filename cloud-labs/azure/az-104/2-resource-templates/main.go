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

		example, err := core.NewResourceGroup(ctx, "The0xResourceGroup", &core.ResourceGroupArgs{
			Name:     pulumi.String("The0xResourceGroup"),
			Location: pulumi.String("East US"),
		})
		if err != nil {
			return err
		}

		// Template deploymnts are going to be deprecated in v4 of the ARM provider.
		// In the future, we will have to use management.NewGroupTemplateDeployment

		_, err = core.NewTemplateDeployment(ctx, "The", &core.TemplateDeploymentArgs{
			Name:              pulumi.String("The0xDemoDeployment"),
			ResourceGroupName: example.Name,
			DeploymentMode:    pulumi.String("Incremental"),
			TemplateBody:      pulumi.String(template),
			Parameters: pulumi.StringMap{
				"storageAccountName": pulumi.String("the0xsa"),
				"location":           pulumi.String("eastus"),
				"resourceGroup":      example.Name,
			},
		})
		if err != nil {
			return err
		}

		return nil
	})
}
