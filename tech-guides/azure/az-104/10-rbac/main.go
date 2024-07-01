package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/authorization"
	"github.com/pulumi/pulumi-azure/sdk/v5/go/azure/core"
	"github.com/pulumi/pulumi-azuread/sdk/v5/go/azuread"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func errCheck(err error) {
	if err != nil {
		panic(err)
	}
}

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		user, err := azuread.NewUser(ctx, "the0xSec", &azuread.UserArgs{
			UserPrincipalName:   pulumi.String("the0xSec@ysacthe0x.onmicrosoft.com"),
			DisplayName:         pulumi.String("the0xSec"),
			Password:            pulumi.String("P@ssw0rd"),
			ForcePasswordChange: pulumi.Bool(true),
			AccountEnabled:      pulumi.Bool(true),
		})
		errCheck(err)

		_, err = azuread.NewDirectoryRoleAssignment(ctx, "userAdministrator", &azuread.DirectoryRoleAssignmentArgs{
			RoleId:            pulumi.String("fe930be7-5e62-47db-91af-98c3a49a38b1"),
			PrincipalObjectId: user.ID(),
		})
		errCheck(err)

		rg, err := core.NewResourceGroup(ctx, "rg", &core.ResourceGroupArgs{
			Location: pulumi.String("eastus"),
		})
		errCheck(err)

		_, err = authorization.NewRoleAssignment(ctx, "readerRole", &authorization.RoleAssignmentArgs{
			PrincipalId:      user.ID(),
			PrincipalType:    pulumi.String("User"),
			RoleDefinitionId: pulumi.String("/subscriptions/739d8157-cd10-4b51-b2b3-75bd66a16d7e/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"),
			Scope:            rg.ID(),
		})
		errCheck(err)

		ctx.Export("userId", user.ID())

		return nil
	})
}
