<p><a target="_blank" href="https://app.eraser.io/workspace/I0uihd6cBQ36T3P2C6Ug" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

# Understand Azure Resource Locks Work
In this lab, you will read and learn about Azure Resource Locks.

Reference Documentation:

- [﻿Azure Resource Locks](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources) 
---

## How to deploy Azure Locks
In this lab, deploy the Azure Resource Group and Resource Locks using Pulumi defined in `main.go` file. Login to the Azure portal and verify the deployment of the Locks to the deployed resources. Notice how the policy is tied to the resource group called `the0xResourceGroup`. From here, with the lock enabled, try to delete the resource group via the portal and by doing a pulumi down operation. Notice the error? This is the power of Azure Locks.

## Goal
The goal is to deploy the Azure Resource Group and Resource Locks using Pulumi, understand the lack of inheritance of the locks, and verify the deployment of the locks in the Azure portal.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.



<!--- Eraser file: https://app.eraser.io/workspace/I0uihd6cBQ36T3P2C6Ug --->