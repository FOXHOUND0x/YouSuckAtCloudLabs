# Understand Azure Resource Groups
In this lab, you will read and learn about Azure Resource Groups.

Reference Documentation:
- [Azure Resource Manager Overview](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview)
- [The 0x - AZ-104 Guide](https://publish.obsidian.md/ysac/Azure/AZ-104/AZ-104)

---
## How to deploy Azure Resource Groups using Pulumi
In this lab, deploy the Azure Resource Group using Pulumi defined in `main.go` file. Login to the Azure portal and verify the deployment of the resource group and the storage account. Notice how the storage account is tied to the resource group called `the0xResourceGroup`.

## Goal
The goal is to see how the Storage Account is tied to the Resource Group and that various resources objects are grouped together in a logical manner.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.
