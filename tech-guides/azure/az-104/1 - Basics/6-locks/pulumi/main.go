package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/resources/v2"
	"github.com/pulumi/pulumi-azure/sdk/v5/go/azure/management"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		resourceGroup, err := resources.NewResourceGroup(ctx, "resourceGroup", nil)
		if err != nil {
			return err
		}

		lock, err := management.NewLock(ctx, "resourceLockThe0x", &management.LockArgs{
			LockLevel: pulumi.String("CanNotDelete"),
			Name:      pulumi.String("resourceLockThe0x"),
			Notes:     pulumi.String("This lock is to prevent accidental deletion of the resource"),
			Scope:     resourceGroup.ID(),
		})
		if err != nil {
			return err
		}

		// CHALLENGE: using pulumi, deploy a storageAccount resource and create a lock at the resource level here.. Can you do it? :D

		ctx.Export("resourceGroupName", resourceGroup.Name)
		ctx.Export("lockName", lock.Name)
		return nil
	})
}
