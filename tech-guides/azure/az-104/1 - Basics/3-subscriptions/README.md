<p><a target="_blank" href="https://app.eraser.io/workspace/609zFkYrJ6DwCvcoRXhN" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

# OUT OF SCOPE FOR AZ-104
## Understand Azure Subscriptions and Management Groups
In this lab, you will learn how to programmatically deploy a new Azure Subscription and Management Group using Terraform.

Reference Documentation:

- [﻿Azure Subscriptions and Tenants Overview](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/create-subscription)  
- [﻿The 0x - AZ-104 Subscriptions](https://publish.obsidian.md/ysac/Azure/AZ-104/Subscription+Management) 
---

## How to deploy Azure Resource Groups using Terraform
In this lab, deploy the Azure Resource Group using Pulumi defined in `main.go` file. Login to the Azure portal and verify the deployment of the Azure Subscription has been created. We will not be creating any resources in this lab, just the subscription.

## Goal
The goal is to see how Azure Subscriptions and Management Groups can be created programmatically using Pulumi to help build a understanding of Azure Organizational Hierarchy.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.



<!--- Eraser file: https://app.eraser.io/workspace/609zFkYrJ6DwCvcoRXhN --->