<p><a target="_blank" href="https://app.eraser.io/workspace/xWbKMC6PUPk3CmTlvB99" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

# Understand the core concepts of RBAC in Azure
The goal in this lab is to understand the scoping differences between azure roles and azure active directory roles. (Azure AD Roles). In this lab you are going to create a new user and assign them a role AD roles (user admin). We will deploy a resource group into our subscription, then we will assign an azure reader role to the user we created for the resource group. This is going to allow the user to read the infrastructure components within the subscription and the resource group, but will also allow them to manage other users at the tenant level of our Azure Entra Tenant.

--- Explainaing the difference between Azure Roles and Azure AD Roles ---

## What is RBAC
Role based access control can be broken down simple into 3 of the 5 "W's". Who, What and Why. 

### What Are Azure Roles
Azure roles are about managing azure resources within an azure subscription. Simply put, roles are simply about controlling what you can do with azure services.

[﻿Azure Roles](https://app.eraser.io/workspace/BHwWWXh1FIPMdoILWuG5?elements=H-942cEJ85ENewL6PEqwfw) 

[﻿Starter Role](https://app.eraser.io/workspace/BHwWWXh1FIPMdoILWuG5?elements=T8UY-I4_rNL_iK8SQGA6dw) 

### What are Azure Active Directory Roles
Azure AD Roles on the other hand are about controlling the identities and their access to those services. You can think of this as a higher level roles that comes with alot more responsibility.


<!-- eraser-additional-content -->
## Diagrams
<!-- eraser-additional-files -->
<a href="/tech-guides/azure/az-104/10-rbac/README-Azure Roles-1.eraserdiagram" data-element-id="CsJ7Pz0vQGar5PAiVBRK5"><img src="/.eraser/xWbKMC6PUPk3CmTlvB99___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----dc25ad156488ae96929ceccf19131b45-Azure-Roles.png" alt="" data-element-id="CsJ7Pz0vQGar5PAiVBRK5" /></a>
<a href="/tech-guides/azure/az-104/10-rbac/README-cloud-architecture-2.eraserdiagram" data-element-id="tfLDpwSHMqW3i7QYnQmtu"><img src="/.eraser/xWbKMC6PUPk3CmTlvB99___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----805ab9f5e5dd1677d1b46235a5e8fd03.png" alt="" data-element-id="tfLDpwSHMqW3i7QYnQmtu" /></a>
<!-- end-eraser-additional-files -->
<!-- end-eraser-additional-content -->
<!--- Eraser file: https://app.eraser.io/workspace/xWbKMC6PUPk3CmTlvB99 --->