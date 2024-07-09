package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/costmanagement/v2"
	"github.com/pulumi/pulumi-azure-native-sdk/resources/v2"
	"github.com/pulumi/pulumi-azure-native-sdk/storage/v2"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		rg, err := resources.NewResourceGroup(ctx, "the0xResourceGroup", &resources.ResourceGroupArgs{
			Location:          pulumi.String("WestUS"),
			ResourceGroupName: pulumi.String("the0x-resource-group"),
			Tags: pulumi.StringMap{
				"Environment": pulumi.String("Test"),
			},
		})
		if err != nil {
			return err
		}

		storageAccount, err := storage.NewStorageAccount(ctx, "the0xStorageAccount", &storage.StorageAccountArgs{
			AccountName:            pulumi.String("the0xsa"),
			EnableHttpsTrafficOnly: pulumi.Bool(true),
			EnableNfsV3:            pulumi.Bool(false),
			IsHnsEnabled:           pulumi.Bool(false),
			Kind:                   pulumi.String("StorageV2"),
			Location:               rg.Location,
			ResourceGroupName:      rg.Name,
			Sku: &storage.SkuArgs{
				Name: pulumi.String("Standard_LRS"),
			},
			Tags: pulumi.StringMap{
				"Environment": pulumi.String("Test"),
			},
		})

		if err != nil {
			return err
		}

		_, err = storage.NewBlobContainer(ctx, "the0xContainer", &storage.BlobContainerArgs{
			AccountName:       storageAccount.Name,
			ContainerName:     pulumi.String("cost-exports"),
			ResourceGroupName: rg.Name,
		})

		if err != nil {
			return err
		}

		costExport, err := costmanagement.NewExport(ctx, "the0xCostExport", &costmanagement.ExportArgs{
			Definition: &costmanagement.ExportDefinitionArgs{
				Timeframe: pulumi.String("MonthToDate"),
				Type:      pulumi.String("Usage"),
				DataSet: &costmanagement.ExportDatasetArgs{
					Configuration: &costmanagement.ExportDatasetConfigurationArgs{
						Columns: pulumi.StringArray{
							pulumi.String("ResourceLocation"),
						},
					},
					Granularity: pulumi.String("Daily"),
				},
			},
			DeliveryInfo: &costmanagement.ExportDeliveryInfoArgs{
				Destination: &costmanagement.ExportDeliveryDestinationArgs{
					Container:      pulumi.String("cost-exports"),
					ResourceId:     storageAccount.ID(),
					RootFolderPath: pulumi.String("cost-exports"),
					SasToken:       pulumi.String(""),
					StorageAccount: storageAccount.Name,
				},
			},
			Scope:         pulumi.String("/subscriptions/739d8157-cd10-4b51-b2b3-75bd66a16d7e"),
			ETag:          pulumi.String("739d8157-cd10-4b51-b2b3-75bd66a16d7e"),
			ExportName:    pulumi.String("the0x-export"),
			Format:        pulumi.String("Csv"),
			PartitionData: pulumi.Bool(false),
			Schedule: &costmanagement.ExportScheduleArgs{
				Recurrence: pulumi.String("Monthly"),
				RecurrencePeriod: &costmanagement.ExportRecurrencePeriodArgs{
					From: pulumi.String("2024-06-21"),
					To:   pulumi.String("2024-06-22"),
				},
				Status: pulumi.String("Active"),
			},
		})

		if err != nil {
			return err
		}

		ctx.Export("costExportName", costExport.Name)
		ctx.Export("storageAccountName", storageAccount.Name)
		return nil
	})
}
