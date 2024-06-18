package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/authorization/v2"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {

		policyRule := pulumi.Map{
			"if": pulumi.Map{
				"field":  pulumi.String("tags"),
				"exists": pulumi.String("false"),
			},
			"then": pulumi.Map{
				"effect": pulumi.String("deny"),
			},
		}

		policyDefinition, err := authorization.NewPolicyDefinition(ctx, "enforceTaggingPolicy", &authorization.PolicyDefinitionArgs{
			PolicyType:  pulumi.String("Custom"),
			PolicyRule:  pulumi.Map(policyRule),
			DisplayName: pulumi.String("Enforce Tagging Policy"),
			Mode:        pulumi.String("Indexed"),
			Description: pulumi.String("This policy ensures that tags are present on all resources."),
		})
		if err != nil {
			return err
		}

		_, err = authorization.NewPolicyAssignment(ctx, "enforceTaggingAssignment", &authorization.PolicyAssignmentArgs{
			PolicyDefinitionId: policyDefinition.ID(),
			Scope:              pulumi.String("/subscriptions/YOUR_SUBSCRIPTION_ID"),
			DisplayName:        pulumi.String("Enforce Tagging Assignment"),
		})
		if err != nil {
			return err
		}

		ctx.Export("taggingEnforcement", policyDefinition.ID())
		return nil
	})
}
