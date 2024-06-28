package main

import (
	"github.com/pulumi/pulumi-azuread/sdk/v5/go/azuread"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func errCheck(err error) {
	if err != nil {
		panic(err)
	}
}

func createGroup(ctx *pulumi.Context, name string, ownerObjectId pulumi.StringInput) (*azuread.Group, error) {
	return azuread.NewGroup(ctx, name, &azuread.GroupArgs{
		DisplayName:     pulumi.String(name),
		MailNickname:    pulumi.String(name),
		SecurityEnabled: pulumi.Bool(true),
		Owners:          pulumi.StringArray{ownerObjectId},
	})
}

func addGroupMember(ctx *pulumi.Context, groupName string, groupId pulumi.IDOutput, memberId pulumi.IDOutput) error {
	_, err := azuread.NewGroupMember(ctx, groupName, &azuread.GroupMemberArgs{
		GroupObjectId:  groupId.ToStringOutput(),
		MemberObjectId: memberId.ToStringOutput(),
	})
	return err
}

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

		current, err := azuread.GetClientConfig(ctx, nil, nil)
		errCheck(err)

		users := []struct {
			name          string
			displayName   string
			mailNickname  string
			userPrincipal string
			roleName      string
			roleID        string
		}{
			{"ericW", "Eric W", "ericw", "ericW@ysacthe0x.onmicrosoft.com", "GlobalAdminRole", "62e90394-69f5-4237-9190-012177145e10"},
			{"issacQ", "Issac Q", "issacq", "issac@ysacthe0x.onmicrosoft.com", "IntuneAdmin", "3a2c62db-5318-420d-8d74-23affee5d9d5"},
			{"JamieK", "Jamie K", "jamiek", "jamie@ysacthe0x.onmicrosoft.com", "appDevelop", "cf1c38e5-3621-4004-a7cb-879624dced7c"},
		}

		var createdUsers []*azuread.User

		for _, user := range users {
			createdUser, err := createUser(ctx, user.name, user.displayName, user.mailNickname, user.userPrincipal, password)
			errCheck(err)
			createdUsers = append(createdUsers, createdUser)

			_, err = createRoleAssignment(ctx, user.roleName, createdUser.ID(), user.roleID)
			errCheck(err)
		}

		devGroup, err := createGroup(ctx, "devGroup", pulumi.String(current.ObjectId))
		errCheck(err)

		err = addGroupMember(ctx, "devGroup", devGroup.ID(), createdUsers[0].ID())
		errCheck(err)

		adminUnit, err := azuread.NewAdministrativeUnit(ctx, "US-Admins", &azuread.AdministrativeUnitArgs{
			DisplayName:             pulumi.String("Admins"),
			Description:             pulumi.String("Administrative unit for global admins"),
			HiddenMembershipEnabled: pulumi.Bool(false),
			Members: pulumi.StringArray{
				createdUsers[0].ID(),
				createdUsers[1].ID(),
			},
			PreventDuplicateNames: pulumi.Bool(true),
		})
		errCheck(err)

		ctx.Export("AdminUnit", adminUnit.ID())
		ctx.Export("ericW", createdUsers[0].ID())
		ctx.Export("jamie", createdUsers[2].ID())
		ctx.Export("devGroup", devGroup.ID())

		return nil
	})
}
