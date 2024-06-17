// // This example is not to be used as-is. It is simply an example of how one might use the Azure Automation SDK to create an Automation Account, Runbook, Runbook Publication, and Webhook to trigger the Runbook to create azure subscriptions on the fly. This is out of scope for the AZ-104 exam, but it is a good example of how one might use the Azure Automation SDK.
// package main

// import (
// 	"github.com/pulumi/pulumi-azure-native-sdk/automation/v2"
// 	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
// )

// func main() {
// 	pulumi.Run(func(ctx *pulumi.Context) error {
// 		account, err := automation.NewAutomationAccount(ctx, "automationAccount", &automation.AutomationAccountArgs{
// 			ResourceGroupName: pulumi.String("your-resource-group"),
// 			Sku: automation.SkuArgs{
// 				Name: pulumi.String("Free"),
// 			},
// 		})
// 		if err != nil {
// 			return err
// 		}

// 		// Create a Runbook to create subscriptions
// 		runbook, err := automation.NewRunbook(ctx, "runbook", &automation.RunbookArgs{
// 			AutomationAccountName: account.Name,
// 			ResourceGroupName:     pulumi.String("your-resource-group"),
// 			RunbookContent: pulumi.String(`
// 				workflow CreateAzureSubscriptions {
// 					param (
// 						[string] $SubscriptionName1,
// 						[string] $SubscriptionName2
// 					)
// 					# Add logic to create Azure subscriptions using PowerShell/ARM templates
// 					# Example: New-AzSubscription -SubscriptionName $SubscriptionName1
// 					#          New-AzSubscription -SubscriptionName $SubscriptionName2
// 				}
// 			`),
// 			RunbookType: pulumi.StringPtr("PowerShellWorkflow"),
// 		})
// 		if err != nil {
// 			return err
// 		}

// 		_, err = automation.NewRunbookPublication(ctx, "runbookPublication", &automation.RunbookPublicationArgs{
// 			AutomationAccountName: account.Name,
// 			ResourceGroupName:     pulumi.String("your-resource-group"),
// 			RunbookName:           runbook.Name,
// 		})
// 		if err != nil {
// 			return err
// 		}

// 		_, err = automation.NewWebhook(ctx, "webhook", &automation.WebhookArgs{
// 			AutomationAccountName: account.Name,
// 			RunbookName:           runbook.Name,
// 			IsEnabled:             pulumi.Bool(true),
// 			ResourceGroupName:     pulumi.String("your-resource-group"),
// 			Uri:                   pulumi.StringOutput(pulumi.Sprintf("https://<your-webhook-url>")),
// 		})
// 		if err != nil {
// 			return err
// 		}

// 		return nil
// 	})
// }
