# Understanding Azure Resource Manager Templates
In this lab you will learn about Azure Resource Manager (ARM) templates. ARM templates are JSON or Bicep files that define the resources to be deployed in Azure. The templates are used to automate the deployment of resources in Azure. The templates can be used to deploy resources in a consistent manner and can be used to deploy resources across different environments.

## Reference Documentation:
- [Azure Resource Manager Overview](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview)
- [The 0x - AZ-104 Guide - ARM Templates](https://publish.obsidian.md/ysac/Azure/AZ-104/Azure+Resource+Manager/Azure+-+Resource+Templates)

---

## How to deploy Azure Resource Manager Templates using Pulumi
In this lab, you will deploy a simple Azure Resource Manager (ARM) template using pulumi. The ARM template is defined in the `main.bicep` file. The template will deploy a resource group and a storage account. The storage account is tied to the resource group.

## Goal
The goal is to understand the core components that make up an ARM template and how to deploy the template using pulumi.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.
