<p><a target="_blank" href="https://app.eraser.io/workspace/vPgIhCxAf8VjvS2FTV5I" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

# Understanding Azure Resource Manager Templates
In this lab you will learn about Azure Resource Manager (ARM) templates. ARM templates are JSON or Bicep files that define the resources to be deployed in Azure. The templates are used to automate the deployment of resources in Azure. The templates can be used to deploy resources in a consistent manner and can be used to deploy resources across different environments.

## Reference Documentation:
- [﻿Azure Resource Manager Overview](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview)  
- [﻿The 0x - AZ-104 Guide - ARM Templates](https://publish.obsidian.md/ysac/Azure/AZ-104/Azure+Resource+Manager/Azure+-+Resource+Templates) 
---

## How to deploy Azure Resource Manager Templates using Pulumi
In this lab, you will deploy a simple Azure Resource Manager (ARM) template using pulumi. The ARM template is defined in the `lab-template.json` file. The template will deploy a resource group and a storage account. The storage account is tied to the resource group.

## Goal
The goal is to understand the core components that make up an ARM template and how to deploy the template using pulumi.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.


<!-- eraser-additional-content -->
## Diagrams
<!-- eraser-additional-files -->
<a href="/cloud-labs/azure/az-104/2-resource-templates/README-Pulumi ARM Template Deployment-1.eraserdiagram" data-element-id="Y-ccqZk8u0hlz_N54nM-k"><img src="/.eraser/vPgIhCxAf8VjvS2FTV5I___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----fc7f0979b2c2b915a6837b62108f14cf-Pulumi-ARM-Template-Deployment.png" alt="" data-element-id="Y-ccqZk8u0hlz_N54nM-k" /></a>
<!-- end-eraser-additional-files -->
<!-- end-eraser-additional-content -->
<!--- Eraser file: https://app.eraser.io/workspace/vPgIhCxAf8VjvS2FTV5I --->