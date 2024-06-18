# Understand Azure Policies
In this lab, you will read and learn about Azure Policies.

Reference Documentation:

- [Azure Policies](https://docs.microsoft.com/en-us/azure/governance/policy/overview) 
- [﻿The 0x - AZ-104 Azure Policies](https://publish.obsidian.md/ysac/Azure/AZ-104/Azure+Policies) 
---

## How to deploy Azure Policies using Pulumi
In this lab, deploy the Azure Policy using Pulumi defined in `main.go` file. Login to the Azure portal and verify the deployment of the policy. Notice how the policy is tied to the resource group called `the0xResourceGroup`.

## Goal
The goal is to see how the azure policy is tied to the Resource Group and that various resources objects are grouped together in a logical manner and stored within a single subscription. In the diagram provided you can see we have a resource-group which consists of a VM and a Storage Account. These two resources are paired together.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.
