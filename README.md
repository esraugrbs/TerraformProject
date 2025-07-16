
# TerraformProject

```

My Terraform version:

> terraform -v

Terraform v1.12.2 on windows\_amd64
provider registry.terraform.io/hashicorp/azurerm v3.117.1


```


---

Questions;

1. **What are  terraform init ,  terraform plan , and  terraform apply , and why do we use them?** 
   - **terraform init** 
     Sets up the working directory, downloads provider plugins and modules.  
   - **terraform plan**
     Shows a preview of changes by comparing config to current state.  
   - **terraform apply**
     Executes the planned changes to create, update or destroy resources.  

2. **What do  terraform fmt ,  terraform validate , and  terraform refresh  do?**
   - **terraform fmt**
     Formats all  .tf  files according to HCL style conventions.  
   - **terraform validate**
     Checks config syntax and basic consistency before execution.  
   - **terraform refresh**
     Reads real resource state and updates the local state file (now  apply -refresh-only ).  

3. **What are  main.tf ,  variables.tf , and  outputs.tf  for?**
   - **main.tf**
     Core infrastructure definitions: providers, resources, modules.  
   - **variables.tf**
     Declares input variables (names, types, defaults).  
   - **terraform.tfvars**
     Assigns concrete values to declared variables.  
   - **outputs.tf**
     Defines values to display after apply (e.g. IP addresses, IDs).  

4. **What is HCL and how does it look?**
   HashiCorp Configuration Language is block-based and easy to read. Example:  
    ```hcl
   block_type "label" {
     argument = "value"
   }
    ```

5. **How do you write a  resource  block in Terraform, and what does it include?**

   ```hcl
   resource "azurerm_resource_type" "name" {
     key          = "value"
     nested_block { … }
   }
   ```

   You specify the provider/type, give it a local name, then list settings and nested blocks.

6. **What is a module, and when/why would you use one?**
   A reusable Terraform package. Use modules to avoid repetition and better organize code.

7. **What is a provider in Terraform?**
   A plugin that lets Terraform communicate with a service (e.g.  azurerm ,  aws ).

8. **What is the Terraform state file ( terraform.tfstate ), and why does it matter?**
   Terraform’s memory of created resources and their attributes. Essential for planning and updates.

9. **What’s the difference between  variables.tf  and  terraform.tfvars ?**

   *  variables.tf  declares variables (names, types, defaults).
   *  terraform.tfvars  assigns real values to those variables.

10. **What are VNet, Subnet, and NSG?**

    * **VNet:** Virtual Network.
    * **Subnet:** Segment of a VNet’s IP space.
    * **NSG:** Network Security Group (firewall rules).

11. **What’s the difference between Public and Private IP?**

    * **Public IP:** Internet-routable address.
    * **Private IP:** Internal address within a VNet.

12. **What does it mean to attach an NSG to a subnet instead of directly to a VM?**
    Subnet-level NSG applies the same rules to every VM in that subnet.

---

## Problems I Experienced & What I Learned

1. **“provider” block error and fix**

   * **Initial (single line):**

     ```hcl
     provider "azurerm" { features {} }
     ```

     **Error:**

     ```
     Error: Argument or block definition required
     ```
   * **What I learned:**
     HCL is block-based; blocks must start and end on their own lines.
   * **Corrected version:**

     ```hcl
     provider "azurerm" {
       features {}
     }
     ```

2. **“location” error and choosing a nearby region**

   * Project spec:  Sweden Central 
   * **Error:**

     ```
     Error: location "Sweden Central" not available
     ```
   * **What I learned:**
     Azure location names must match exactly those supported by your subscription.
   * **Fix:**Switched to  Poland Central .

3. **CIDR block mistake and why it matters**

   * I wrote:

     ```hcl
     vnet_cidr = "10.1.0.0/16"
     ```

     **Error:**

     ```
     Error: Address space overlaps with existing subnet
     ```
   * **What I learned:**
     VNet and Subnet CIDR ranges must not overlap and must align with the team’s network plan.
   * **Fix:**Used  "10.0.0.0/16"  as specified.

---

## How to Run

1. Initialize the Terraform Working Directory

   ```bash
   terraform init
   ```

2. Format Your Configuration Files

   ```bash
   terraform fmt
   ```

3. Validate the Configuration

   ```bash
   terraform validate
   ```

4. Generate an Execution Plan

   ```bash
   terraform plan
   ```

5. Apply the Plan

   ```bash
   terraform apply
   ```

6. Destroy All Resources (when needed)

   ```bash
   terraform destroy
   ```

```
::contentReference[oaicite:0]{index=0}
```
