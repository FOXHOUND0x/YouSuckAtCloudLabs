package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/resources/v2"
	"github.com/pulumi/pulumi-azure-native-sdk/storage/v2"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		resourceGroup, err := resources.NewResourceGroup(ctx, "the0x-resourceGroup", nil)
		if err != nil {
			return err
		}

		account, err := storage.NewStorageAccount(ctx, "sa", &storage.StorageAccountArgs{
			ResourceGroupName: resourceGroup.Name,
			Sku: &storage.SkuArgs{
				Name: pulumi.String("Standard_LRS"),
			},
			Kind: pulumi.String("StorageV2"),
		})
		if err != nil {
			return err
		}

		_, err = storage.NewBlobContainer(ctx, "the0container", &storage.BlobContainerArgs{
			AccountName:       account.Name,
			ResourceGroupName: resourceGroup.Name,
		})
		if err != nil {
			return err
		}

		_, err = storage.NewManagementPolicy(ctx, "policy", &storage.ManagementPolicyArgs{
			AccountName:          account.Name,
			ManagementPolicyName: pulumi.String("default"),
			Policy: &storage.ManagementPolicySchemaArgs{
				Rules: storage.ManagementPolicyRuleArray{
					&storage.ManagementPolicyRuleArgs{
						Definition: &storage.ManagementPolicyDefinitionArgs{
							Actions: &storage.ManagementPolicyActionArgs{
								BaseBlob: &storage.ManagementPolicyBaseBlobArgs{
									Delete: &storage.DateAfterModificationArgs{
										DaysAfterModificationGreaterThan: pulumi.Float64(30),
									},
									TierToCool: &storage.DateAfterModificationArgs{
										DaysAfterModificationGreaterThan: pulumi.Float64(7),
									},
								},
							},
							Filters: &storage.ManagementPolicyFilterArgs{
								BlobTypes: pulumi.StringArray{
									pulumi.String("blockBlob"),
								},
								PrefixMatch: pulumi.StringArray{
									pulumi.String("container1/"),
								},
							},
						},
						Enabled: pulumi.Bool(true),
						Name:    pulumi.String("MoveToCoolAndDeleteRule"),
						Type:    pulumi.String("Lifecycle"),
					},
				},
			},
			ResourceGroupName: resourceGroup.Name,
		})
		if err != nil {
			return err
		}

		ctx.Export("resourceGroupName", resourceGroup.Name)
		ctx.Export("accountName", account.Name)
		return nil
	})
}
