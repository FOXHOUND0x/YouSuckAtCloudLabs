<p><a target="_blank" href="https://app.eraser.io/workspace/mYFpWRMqFgWYSM9x7yWk" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

## Assigning Resource Access
In this lab we are going to overview how you can assign access to resources that is inside our cloud lab. 

## What are Role Definitions?
Role Definitions are are collection of JSON (JavaScript Object Notation) permissions that specify what actions are either allowed/denied access to.

The following is an example of sample Role Definition

```
"Actions": ["*"], <- Defines what actions are allowed
"NotActions": ["Auth/*/Delete"], <- Deny Actions
"DataAction":[], <- Data related actions (data in SA)
"NotDataActions":[], <- data related denys actions
"AssignableScopes":["/"] <- Define the scope for the resource
```
### What are additive properties?
Azure RBAC uses a additive permissions model which means that the effective permissions given to a user are the overall summation of their role assignments. These roles combine together to grant a broader access. This allows users to combine various roles to achieve organizational need.

[﻿View on canvas](https://app.eraser.io/workspace/mYFpWRMqFgWYSM9x7yWk?elements=UnwM4rfzQ1foUlFjzvwjUA) 



### Lab Goals
We are going to create a user inside of our microsoft entra service, then attach 2 roles ["contributor", "reader"] to this user. This will help us understand the concept of additive properties. From here we will delete the  roles that are assigned to the user then create 2 custom roles with custom role definitions. We will deploy 2 azure storage accounts, one at the resource group level and another at the subscription level. We will play around with figuring out what our user can and cannot see as the permission for the custom roles will be scoped to the RG. This will help us solidify our understanding of permissions inheritance and scopes.






<!-- eraser-additional-content -->
## Diagrams
<!-- eraser-additional-files -->
<a href="/tech-guides/azure/az-104/11-resource-access/README-entity-relationship-1.eraserdiagram" data-element-id="sDq0AeKaI5n8yMT5hLEd8"><img src="/.eraser/mYFpWRMqFgWYSM9x7yWk___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----9119e014fce937f5906eafc6a45a772f.png" alt="" data-element-id="sDq0AeKaI5n8yMT5hLEd8" /></a>
<!-- end-eraser-additional-files -->
<!-- end-eraser-additional-content -->
<!--- Eraser file: https://app.eraser.io/workspace/mYFpWRMqFgWYSM9x7yWk --->