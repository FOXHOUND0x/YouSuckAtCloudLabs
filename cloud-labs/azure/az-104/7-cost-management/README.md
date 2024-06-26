# Understand Azure Cost Management Tools with terraform
In this lab, you will read and learn about Azure Cost Management Tools and how to use them to manage and optimize your Azure costs.

Reference Documentation:

- [Azure Cost Management](https://docs.microsoft.com/en-us/azure/cost-management-billing/cost-management-billing-overview)
- [The0x Cost Management](https://publish.obsidian.md/ysac/Azure/AZ-104/Cost+Management)
---

## To complete this lab you will need the following:
Register the Cost Management Exports provider by running the following command:
```az provider register --namespace Microsoft.CostManagementExports```

You can check the status of the registration by running the following command:
```az provider show --namespace Microsoft.CostManagementExports --query "registrationState"```

## How to use Azure Cost Management Tools
In this lab you will learn how you can use Azure Cost Management Tools to visualize and manage your azure costs and how you can use terraform to deploy a cost management view via terraform.

## Goal
The goal here is to give you an understanding of the various cost management tools and how using terraform to manage their deployment configurations can help you become more familiar with IaC overall.

## Cleanup
After you have verified the deployment, remove the resources by running `terraform apply` and then `terraform destroy` to remove the stack.
