# Link
* Terraform
  * [Get Started - Azure](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?in=terraform/azure-get-started)
  * [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
  * [Terraform Language Documentation](https://www.terraform.io/language)
* Microsoft
  * [Terraform on Azure documentation](https://docs.microsoft.com/en-us/azure/developer/terraform/)
* Ned In The Cloud
  * [Terraform Basics](https://www.youtube.com/playlist?list=PLXb5972EMl4BfKVDMaJH6Pg9SI6q_HqMg)
  * [Terraform Tuesdays](https://www.youtube.com/playlist?list=PLXb5972EMl4BWj8cAq9AZgeKBa2M8_7-y)

# Training Approach
1. Collateral for this course is in [lvs-hackathon-2022](https://github.com/longviewsystems/lvs-hackathon-2022)
1. Use [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview) 
   * Required software is already installed in the cloud shell.  Required software is terraform and az cli.
   * Standard terraform install is [here](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/azure-get-started).
2. Terraform
   * Generally following [Get Started - Azure](https://learn.hashicorp.com/collections/terraform/azure-get-started)
   * Modules are important in Terraform.
     * [Reuse Configuration with Modules](https://learn.hashicorp.com/collections/terraform/modules)

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

## Terraform Commands
| Command | Description |
| --- | --- |
| `terraform init` | Initialize the configuration.  Usually only required one time. |
| `terraform plan` | Plan the changes. |
| `terraform apply` | Apply the changes. |
| `terraform destroy` | Destroy the resources. |

## Linux Commands Cheat Sheet

| Command | Description |
| --- | --- |
| `cd ./path` | Change directory to ./path |
| `ls` | List files in current directory |
| `mkdir ./working` | Create directory ./working |
| `rm -rf` | Remove directory |