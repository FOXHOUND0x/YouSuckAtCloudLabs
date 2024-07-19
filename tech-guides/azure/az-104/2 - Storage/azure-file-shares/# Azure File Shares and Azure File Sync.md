<p><a target="_blank" href="https://app.eraser.io/workspace/GpPinfiofPREsqOZRJGi" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

In this lab we are going to cover Azure file Shares and Azure File Sync. You can go further into depth with the written blog post over on the technical blog post over at the you suck at cloud blog to get a in depth analysis.



Simply put, azure file shares are managed file systems that live within your azure storage account. They allow your to easily migrate file servers to the cloud or to create easily accessible hybrid storage solutions. There are various architectural patterns that can be followed, such as using on-prem windows file servers as cache endpoints for example.



In this lab we deploy a single azure file share into our azure subscription and resource group using `terraform` . From here we use the Microsoft Entra as our authentication point to the share itself from our local machine. The diagram below demonstrates the flow

![Figure 1](/.eraser/GpPinfiofPREsqOZRJGi___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---figure---mToXA_4Buw_grckOP3X0H---figure---bNg73WNpL7u8zWkdX7xNBQ.png "Figure 1")




<!-- eraser-additional-content -->
## Diagrams
<!-- eraser-additional-files -->
<a href="/tech-guides/azure/az-104/2 - Storage/azure-file-shares/# Azure File Shares and Azure File Sync-Azure Single Tenant with Storage Account and File Share-1.eraserdiagram" data-element-id="8hat6ExEwk8MZCAzstnAL"><img src="/.eraser/GpPinfiofPREsqOZRJGi___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----db0e8029aece7aa17a1ac359632c4632-Azure-Single-Tenant-with-Storage-Account-and-File-Share.png" alt="" data-element-id="8hat6ExEwk8MZCAzstnAL" /></a>
<!-- end-eraser-additional-files -->
<!-- end-eraser-additional-content -->
<!--- Eraser file: https://app.eraser.io/workspace/GpPinfiofPREsqOZRJGi --->