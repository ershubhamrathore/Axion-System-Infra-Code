# Axion System Infrastructure

This repository contains Terraform configurations to provision infrastructure on Azure for the Axion System. It is structured into separate environments to provide clear isolation between deployment stages.

## Environments

* **`preprod/`**: Pre-production environment infrastructure. Provisions the following Azure resources:
  * Resource Group
  * Virtual Network (VNet) & Subnets
  * Public IPs
  * Linux Virtual Machines (with NICs and NSGs)
  * PostgreSQL Flexible Server
* **`prod/`**: Production environment infrastructure. Demonstrates resource group and storage account deployment utilizing an Azure remote backend.

## Repository Structure

```text
Axion-System-Infra-Code/
├── preprod/
│   ├── main.tf             # Resource module calls
│   ├── provider.tf         # AzureRM provider configuration
│   ├── variables.tf        # Input variable definitions
│   └── terraform.tfvars    # Example variable assignments
├── prod/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── terraform.tfvars
└── .gitignore
```

## Prerequisites

* [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) installed.
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated.
* Active Azure Subscription with appropriate permissions.
* AzureRM Provider `v5.3.0`.

## Getting Started

1. **Authenticate with Azure**:
   ```bash
   az login
   az account set --subscription "<Your-Subscription-ID>"
   ```

2. **Initialize Terraform (Example for Preprod)**:
   ```bash
   cd preprod
   terraform init
   ```
   *Note: For the `prod` environment, ensure the remote storage backend (Resource Group & Storage Account) is created before running initialization.*

3. **Review and Plan**:
   ```bash
   terraform plan -out=tfplan
   ```

4. **Apply the Changes**:
   ```bash
   terraform apply tfplan
   ```

> **Important note on Modules:** The environment configurations (`preprod/main.tf`, `prod/main.tf`) source reusable custom Terraform modules using a relative path (`../../modules/`). Ensure that the external `modules/` directory is available two directories up from your active environment, or update the module `source` paths if you re-structure the repository.

## Security & Best Practices

- **Manage Secrets Securely:** The example `terraform.tfvars` files might contain sensitive attributes like `admin_password`. Do not commit real passwords or SSH private keys into version control. Leverage Azure Key Vault, environment variables (`TF_VAR_...`), or CI/CD secret managers for sensitive values.
- **State Files:** Ensure remote backends are secured with appropriate RBAC (Role-Based Access Control) and avoid pushing local `.tfstate` files to version control (as configured in `.gitignore`).
- **Network Security:** Review NSGs (Network Security Groups) and Public IP assignments. Ensure access like SSH (TCP 22) or Database endpoints is restricted to trusted IPs.

## Clean up

To destroy the deployed infrastructure and avoid unexpected costs:

```bash
cd preprod
terraform plan -destroy
terraform destroy
```
