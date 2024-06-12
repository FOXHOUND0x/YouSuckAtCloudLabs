# How to Authenticate Pulumi with Azure

This guide provides step-by-step instructions to authenticate Pulumi with Azure, enabling you to deploy and manage your infrastructure using Pulumi with Azure resources. This will be used in all of the azure based labs in this directory.

## Prerequisites

-  An active Azure account. If you don't have one, [create an Azure account](https://azure.microsoft.com/en-us/free/).
-  Azure CLI installed. You can download and install it from the [official Azure CLI documentation](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
-  Pulumi CLI installed. You can download and install it from the [Pulumi installation guide](https://www.pulumi.com/docs/get-started/install/).

## Steps to Authenticate Pulumi with Azure

### 1. Install the Azure CLI

Ensure you have the Azure CLI installed. If you don’t have it installed, follow the instructions below based on your operating system.

#### For macOS:

```sh
brew install azure-cli
```

#### For Windows:

Download and install the MSI from the [official site](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=windows-msi).

#### For Linux:

Use the installation script:

```sh
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### 2. Log in to Azure

Use the Azure CLI to authenticate your device to Azure.

```sh
az login
```

Follow the instructions to authenticate your device by opening a browser and visiting the URL provided, then entering the provided code.

### 3. Set the Active Subscription

If your Azure account has multiple subscriptions, list them using:

```sh
az account list --output table
```

Set the desired subscription:

```sh
az account set --subscription "your-subscription-id"
```

### 4. Authenticate Pulumi with Azure

Pulumi needs the Azure credentials to deploy resources. Configure Pulumi to use the Azure CLI for authentication.

1. **Configure Pulumi to use Azure authentication**:
   Pulumi reads the Azure credentials from the Azure CLI by default. No additional configuration is needed if the Azure CLI is authenticated.  

2. **Verify Authentication**:
   To ensure Pulumi can authenticate with Azure, create a new Pulumi project or use an existing one and perform a preview.

```sh
pulumi new azure-csharp  # for new project, choose your preferred template
pulumi up --preview      # for preview of existing project
```

This will perform a dry run, showing what resources would be created or updated. Follow the prompts to select or create a Pulumi stack.

### 5. Run Pulumi Commands

With authentication set up, you can now use Pulumi to manage Azure resources. Here are a few commonly used commands:

-  `pulumi up`: Deploy your infrastructure.
-  `pulumi preview`: Show what changes will be made without actually applying them.
-  `pulumi destroy`: Remove all deployed infrastructure.
-  `pulumi stack`: Manage your Pulumi stacks.

## Troubleshooting

If you encounter issues with authentication, check the following:

-  Ensure the Azure CLI is installed and the command `az login` works correctly.
-  Validate the correct subscription is set using `az account set`.
-  Check your environment variables for any conflicting credentials.

For detailed troubleshooting, refer to the [Pulumi Azure provider documentation](https://www.pulumi.com/docs/reference/pkg/azure/).

## Conclusion

This guide should help you authenticate Pulumi with Azure and start managing your Azure resources programmatically. For more detailed scenarios and advanced configurations, refer to the [Pulumi Azure documentation](https://www.pulumi.com/docs/reference/pkg/azure/).
