<p><a target="_blank" href="https://app.eraser.io/workspace/K5FzVPtJKfp1JRe7Qytm" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>



### Programmatically Manage Users and Groups within Microsoft Entra ID.
In this lab you are going to deploy 2 types of users within Microsoft Entra ID using Pulumi. One user will be a global administrator and another will be a normal "member". You will create these users with a method called `Bulk Add Users` with a CSV file ingestion. Post initial deployment, you will need to update the user properties to grant access of the member to a group that has access to maintain resources inside of The0xSec Resource Group.

Reference Documentation:

- [﻿Azure SaaS Architecture Models](https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/multi-tenant-saas-architecture) 



<!-- eraser-additional-content -->
## Diagrams
<!-- eraser-additional-files -->
<a href="/cloud-labs/azure/az-104/9-users-groups/README-entity-relationship-1.eraserdiagram" data-element-id="_mXO17SlB44LZRUgtfvRv"><img src="/.eraser/K5FzVPtJKfp1JRe7Qytm___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----3a87784f8eb6bc27af95b05d62eed6ab.png" alt="" data-element-id="_mXO17SlB44LZRUgtfvRv" /></a>
<a href="/cloud-labs/azure/az-104/9-users-groups/README-Managing User Flow Entra-ID-2.eraserdiagram" data-element-id="CZsjZK21PGMCD3jwjqDgF"><img src="/.eraser/K5FzVPtJKfp1JRe7Qytm___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----80b94ed8ff5409c268c5da90cec7b9c1-Managing-User-Flow-Entra-ID.png" alt="" data-element-id="CZsjZK21PGMCD3jwjqDgF" /></a>
<!-- end-eraser-additional-files -->
<!-- end-eraser-additional-content -->
<!--- Eraser file: https://app.eraser.io/workspace/K5FzVPtJKfp1JRe7Qytm --->