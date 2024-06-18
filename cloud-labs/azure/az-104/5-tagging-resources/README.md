# Understand Azure Tagging Works
In this lab, you will read and learn about Azure Policies.

Reference Documentation:

- [Azure Tagging](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources) 
---

## How to deploy Azure Tags
In this lab, deploy the Azure Resource Group and Rsource Tags using Pulumi defined in `main.go` file. Login to the Azure portal and verify the deployment of the Tags to the deployed resources. Notice how the policy is tied to the resource group called `the0xResourceGroup`.

## Goal
The goal is to deploy the Azure Resource Group and Resource Tags using Pulumi, understand the lack of inheritance of the tags, and verify the deployment of the tags in the Azure portal.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.
