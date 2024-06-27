package main

import (
	"github.com/pulumi/pulumi-azuread/sdk/v5/go/azuread"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func createUser(ctx *pulumi.Context, name, displayName, mailNickname, userPrincipalName, password string) (*azuread.User, error) {
	return azuread.NewUser(ctx, name, &azuread.UserArgs{
		DisplayName:         pulumi.String(displayName),
		MailNickname:        pulumi.String(mailNickname),
		UserPrincipalName:   pulumi.String(userPrincipalName),
		AccountEnabled:      pulumi.Bool(true),
		ForcePasswordChange: pulumi.Bool(true),
		Password:            pulumi.String(password),
	})
}

func createRoleAssignment(ctx *pulumi.Context, name string, principalObjectId pulumi.IDOutput, roleId string) (*azuread.DirectoryRoleAssignment, error) {
	return azuread.NewDirectoryRoleAssignment(ctx, name, &azuread.DirectoryRoleAssignmentArgs{
		PrincipalObjectId: principalObjectId,
		DirectoryScopeId:  pulumi.String("/"),
		RoleId:            pulumi.String(roleId),
	})
}

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		const password = "P@ssw0rd"

		ericW, err := createUser(ctx, "ericW", "Eric W", "ericw", "ericW@ysacthe0x.onmicrosoft.com", password)
		if err != nil {
			return err
		}

		jamie, err := createUser(ctx, "JamieK", "Jamie K", "jamiek", "jamie@ysacthe0x.onmicrosoft.com", password)
		if err != nil {
			return err
		}

		if _, err := createRoleAssignment(ctx, "globalAdmin", ericW.ID(), "62e90394-69f5-4237-9190-012177145e10"); err != nil {
			return err
		}

		if _, err := createRoleAssignment(ctx, "appDevelop", ericW.ID(), "cf1c38e5-3621-4004-a7cb-879624dced7c"); err != nil {
			return err
		}

		ctx.Export("userPrincipalName", ericW.UserPrincipalName)
		ctx.Export("objectId", jamie.ObjectId)

		return nil
	})
}
