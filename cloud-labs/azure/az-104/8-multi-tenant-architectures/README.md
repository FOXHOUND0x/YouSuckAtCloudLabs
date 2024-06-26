# Understand Various SaaS based architecture models
In this lab, yoi will learn about two primary SaaS based architecture models, Multi-tenant (URL-Based) and (Virtualization-Based) and how they differ from each other.

Reference Documentation:

- [Azure SaaS Architecture Models](https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/multi-tenant-saas-architecture)
- [The0x Multi-Tenant Architecture Models](https://publish.obsidian.md/ysac/Azure/AZ-104/Azure+Active+Directory/Azure+-+Multi-Tenant+Architecture+Model)

## Limitation
You will need to use the console in this lab to create the two tenants due to terms and conditions of the microsoft entra admin center. For me I just set up trials and used the console to create the two tenants `the0x1.app.dev` and `the0x2.app.dev`

## NOTE: The normal azure portal does not allow you to create tenants, but if you navigate to the new entra admin center, you can create tenants there.[Entra Admin Center](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/DirectorySwitchBlade/subtitle/)