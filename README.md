# TerraformProject

My terraform version:
> terraform -v
Terraform v1.12.2
on windows_amd64
+ provider registry.terraform.io/hashicorp/azurerm v3.117.1

Questions:
1. What are terraform init, terraform plan, and terraform apply, and why do we use them?
•  terraform init
	Sets up the working directory, downloads provider plugins and modules.
•  terraform plan
	Shows a preview of changes by comparing config to current state.
•  terraform apply
	Executes the planned changes to create, update or destroy resources.

2. What do terraform fmt, terraform validate, and terraform refresh do?
•  terraform fmt
	Formats all .tf files according to HCL style conventions.
•  terraform validate
	Checks config syntax and basic consistency before execution.
•  terraform refresh
	Reads real resource state and updates the local state file (now apply -refresh-only).

3. What are main.tf, variables.tf, and outputs.tf for?
•  main.tf
	Core infrastructure definitions: providers, resources, modules.
•  variables.tf
	Declares input variables (names, types, defaults).
•  terraform.tfvars
	Assigns concrete values to declared variables.
•  outputs.tf
	Defines values to display after apply (e.g. IP addresses, IDs).

4. What is HCL and how does it look?
•  HCL
     HashiCorp Configuration Language (HCL) is a simple, block-based syntax that’s easy to read and write. You define things like this: 

 block_type "label" {
  argument = "value"
}   


5. How do you write a resource block in Terraform, and what does it include?
•  resource block
   resource "azurerm_resource_type" "name" {
    # key = "value"
    # nested_block { … }
}
   You specify the provider+type, give it a local name, and then list
   all the settings and any nested blocks it needs.

6. What is a module, and when/why would you use one?
•  module
	Reusable Terraform package; use to avoid repetition and organize code.

7. What is a provider in Terraform?
•  provider
	Plugin that lets Terraform talk to a service (e.g. azurerm, aws).

8. What is the Terraform state file (terraform.tfstate), and why does it matter?
•  terraform.tfstate
	The state file is Terraform’s memory—it keeps track of what it created and what attributes each resource has. Without it, Terraform wouldn’t know how to plan updates or what already exists.

9. What’s the difference between variables.tf and terraform.tfvars?
•  variables.tf declares which variables your config uses (names, types, defaults) and terraform.tfvars actually assigns real values to those variables, so you don’t hardcode values inside your .tf files.

10. What are VNet, Subnet, and NSG?
•  VNet, Subnet, NSG
	VNet: virtual network
	Subnet: segment of a VNet’s IP space
	NSG: firewall rules applied to control traffic

11. What’s the difference between Public and Private IP?
•  Public vs Private IP
	Public: internet-routable address
	Private: internal address within a VNet

12. What does it mean to attach an NSG to a subnet instead of directly to a VM?
•  NSG on subnet vs VM
	Subnet-level NSG applies the same rules to every VM in that subnet.

The problems I experienced and what I learned:

1. “provider” block error and fix
Initial attempt (single line):
provider "azurerm" { features {} }
➜ Error: HCL parser could not separate the block content in one line
Error: Argument or block definition required

What I learned:
HCL is block-based, and each block must start and end on its own lines for the parser to understand it.

Corrected version:
provider "azurerm" {
features {}
}

2. “location” error and choosing a nearby region
• The project specification said “Sweden Central.”
• My subscription did not support that location, so I saw:
Error: location "Sweden Central" not available
• I switched to “Poland Central,” which worked without error.

What I learned:
I discovered that Azure locations must match exactly the names your subscription allows, so I switched to “Poland Central,” which worked without errors.

3. CIDR block mistake and why it matters
• I wrote vnet_cidr = "10.1.0.0/16" and got:
Error: Address space overlaps with existing subnet
• The project actually required the 10.0.0.0/16 block.
What I learned:
– VNet and subnet CIDR ranges must not overlap.
– They must align with the team’s overall network plan.

How It run?
1. Initialize the Terraform Working Directory
 -terraform init

2. Format Your Configuration Files
 -terraform fmt

3. Validate the Configuration
 -terraform validate

4. Generate an Execution Plan
 -terraform plan 

5. Apply 
 -terraform apply

6. Destroy (Don't forget this part!)
 -terraform destroy