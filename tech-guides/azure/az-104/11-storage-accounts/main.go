package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/resources/v2"
	"github.com/pulumi/pulumi-azure-native-sdk/storage/v2"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		resourceGroup, err := resources.NewResourceGroup(ctx, "resourceGroup", nil)
		if err != nil {
			return err
		}

		storageAccount, err := storage.NewStorageAccount(ctx, "the0xgzrs", &storage.StorageAccountArgs{
			ResourceGroupName: resourceGroup.Name,
			Sku: &storage.SkuArgs{
				Name: pulumi.String("Standard_GZRS"),
			},
			Kind:                   pulumi.String("StorageV2"),
			Location:               resourceGroup.Location,
			EnableHttpsTrafficOnly: pulumi.Bool(true),
		})
		if err != nil {
			return err
		}

		ctx.Export("storageAccountName", storageAccount.Name)

		return nil
	})
}
