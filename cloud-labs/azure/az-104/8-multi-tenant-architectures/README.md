<p><a target="_blank" href="https://app.eraser.io/workspace/EYOcYAdp3GyRFsiYJ0o5" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

# Understand Various SaaS based architecture models
In this lab, yoi will learn about two primary SaaS based architecture models, Multi-tenant (URL-Based) and (Virtualization-Based) and how they differ from each other.

Reference Documentation:

- [﻿Azure SaaS Architecture Models](https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/multi-tenant-saas-architecture) 
- [﻿The0x Multi-Tenant Architecture Models](https://publish.obsidian.md/ysac/Azure/AZ-104/Azure+Active+Directory/Azure+-+Multi-Tenant+Architecture+Model) 
## Limitation
You will need to use the console in this lab to create the two tenants due to terms and conditions of the microsoft entra admin center. For me I just set up trials and used the console to create the two tenants `the0x1.app.dev` and `the0x2.app.dev` 

## NOTE: The normal azure portal does not allow you to create tenants, but if you navigate to the new entra admin center, you can create tenants there.[﻿Entra Admin Center](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/DirectorySwitchBlade/subtitle/) 



<!-- eraser-additional-content -->
## Diagrams
<!-- eraser-additional-files -->
<a href="/cloud-labs/azure/az-104/8-multi-tenant-architectures/README-Azure Base Single Tenant-1.eraserdiagram" data-element-id="UbLYukGnM-Op879czTP0Q"><img src="/.eraser/EYOcYAdp3GyRFsiYJ0o5___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----2b74cce34cd8046e7e77b20ec0424828-Azure-Base-Single-Tenant.png" alt="" data-element-id="UbLYukGnM-Op879czTP0Q" /></a>
<a href="/cloud-labs/azure/az-104/8-multi-tenant-architectures/README-Azure Base MTA-2.eraserdiagram" data-element-id="uUG6rV7f-O8_hREL1Xqpa"><img src="/.eraser/EYOcYAdp3GyRFsiYJ0o5___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----2c5f948c7fa6627bc18ab4c9c1a2ca69-Azure-Base-MTA.png" alt="" data-element-id="uUG6rV7f-O8_hREL1Xqpa" /></a>
<a href="/cloud-labs/azure/az-104/8-multi-tenant-architectures/README-Azure Multi-Tenant Virtualization-Based SaaS-3.eraserdiagram" data-element-id="cZ43cVnmBgEKf6iuD5nX4"><img src="/.eraser/EYOcYAdp3GyRFsiYJ0o5___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----710deb48484a567271388a02088d4e3d-Azure-Multi-Tenant-Virtualization-Based-SaaS.png" alt="" data-element-id="cZ43cVnmBgEKf6iuD5nX4" /></a>
<a href="/cloud-labs/azure/az-104/8-multi-tenant-architectures/README-URL-Based SaaS-4.eraserdiagram" data-element-id="X3YSzz3sEBpXKX--Drihn"><img src="/.eraser/EYOcYAdp3GyRFsiYJ0o5___5TeIkEqzZuNt0Cv0uz03Dj9ejbv1___---diagram----95411489681b79f98e5b2d4abbfec3e8-URL-Based-SaaS.png" alt="" data-element-id="X3YSzz3sEBpXKX--Drihn" /></a>
<!-- end-eraser-additional-files -->
<!-- end-eraser-additional-content -->
<!--- Eraser file: https://app.eraser.io/workspace/EYOcYAdp3GyRFsiYJ0o5 --->