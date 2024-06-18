<p><a target="_blank" href="https://app.eraser.io/workspace/ROMFgNTCyQVq9uxAeUyM" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

# Understand Azure Tagging Works
In this lab, you will read and learn about Azure Policies.

Reference Documentation:

- [﻿Azure Tagging](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources) 
---

## How to deploy Azure Tags
In this lab, deploy the Azure Resource Group and Rsource Tags using Pulumi defined in `main.go` file. Login to the Azure portal and verify the deployment of the Tags to the deployed resources. Notice how the policy is tied to the resource group called `the0xResourceGroup`.

## Goal
The goal is to deploy the Azure Resource Group and Resource Tags using Pulumi, understand the lack of inheritance of the tags, and verify the deployment of the tags in the Azure portal.

## Cleanup
After you have verified the deployment, remove the resources by running `pulumi destroy` and then `pulumi stack rm dev` to remove the stack.


<!-- eraser-additional-content -->
## Diagrams
<!-- eraser-additional-files -->
<a href="/cloud-labs/azure/az-104/5-tagging-resources/README-cloud-architecture-1.eraserdiagram" data-element-id="iPpNN9Om8E1QMDUFDlwne"><img src="/.eraser/ROMFgNTCyQVq9uxAeUyM___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----b7cacc884870947d7b073dcb7d5eda56.png" alt="" data-element-id="iPpNN9Om8E1QMDUFDlwne" /></a>
<!-- end-eraser-additional-files -->
<!-- end-eraser-additional-content -->
<!--- Eraser file: https://app.eraser.io/workspace/ROMFgNTCyQVq9uxAeUyM --->