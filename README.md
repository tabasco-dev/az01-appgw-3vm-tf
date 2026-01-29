# Azure Application Gateway with 3 Windows Server VMs

This Terraform configuration deploys a basic web application infrastructure in Azure consisting of:
- 3 Windows Server 2022 virtual machines with IIS enabled
- 1 Virtual Network with separate subnets for VMs and Application Gateway
- 1 Application Gateway with public IP for internet access

## Architecture

The Application Gateway acts as the entry point for all web traffic, load balancing requests across the three Windows Server VMs running IIS. The VMs are not directly accessible from the internet, only through the Application Gateway.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (v1.0 or later)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated
- An active Azure subscription

## Setup

1. **Authenticate with Azure:**
   ```bash
   az login
   ```

2. **Create a terraform.tfvars file:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   
   Edit `terraform.tfvars` and set your desired values, especially the `admin_password`.

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Validate the configuration:**
   ```bash
   terraform validate
   ```

5. **Review the deployment plan:**
   ```bash
   terraform plan
   ```

6. **Deploy the infrastructure:**
   ```bash
   terraform apply
   ```

## Configuration

Key variables you can customize in `terraform.tfvars`:

- `resource_group_name` - Name for the resource group
- `location` - Azure region (default: "East US")
- `prefix` - Prefix for all resource names
- `vm_size` - VM size (default: "Standard_B2s")
- `admin_username` - Administrator username for VMs
- `admin_password` - Administrator password for VMs (required, keep secure!)

## Outputs

After deployment, Terraform will output:
- Application Gateway public IP address (use this to access your web application)
- Private IP addresses of the VMs
- Resource group name

## Access the Application

Once deployed, access your web application using the Application Gateway public IP:
```bash
http://<application_gateway_public_ip>
```

Each VM displays a simple HTML page showing its server number.

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Security Notes

- The VMs are only accessible from the Application Gateway subnet for HTTP traffic
- RDP access is allowed for management (consider restricting this in production)
- Store your `terraform.tfvars` file securely and never commit it to version control
- Use Azure Key Vault for storing sensitive credentials in production environments
Design with 3 web servers accessed through an Application Gateway.
