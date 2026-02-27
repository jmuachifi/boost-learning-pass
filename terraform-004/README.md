# Terraform Learning Pass 004

A comprehensive learning project exploring Terraform configurations, modules, state management, and AWS resource provisioning with LocalStack for local development and testing.

## 📋 Overview

This repository contains a progressive series of Terraform configurations (dry-runs) that demonstrate:
- Basic Terraform setup and variables
- Output configurations
- Modular infrastructure design
- AWS EC2 instance provisioning
- State management and dependencies
- LocalStack integration for local AWS simulation

## 🗂️ Project Structure

```
terraform-004/
├── localstack-docker-compose.yml    # LocalStack Docker setup
├── README.md                        # This file
├── dry-run-00/ through dry-run-12/  # Progressive Terraform examples
└── scripts/                         # Utility scripts
```

## 📚 Dry-Run Folders

Each folder represents a learning milestone with increasing complexity:

- **dry-run-00 to dry-run-03**: Foundational Terraform concepts (variables, outputs, basic configurations)
- **dry-run-04**: Architecture documentation and resource provisioning
- **dry-run-05**: Introduction to Terraform modules (aws-ec2-instance module)
- **dry-run-06**: Configuration with terraform.tfvars for variable override
- **dry-run-07**: EC2 instances with initialization scripts
- **dry-run-08**: Sensitive variables and module usage (aws-instance module)
- **dry-run-09**: Script-based user data for instance initialization
- **dry-run-10**: Module-based infrastructure with outputs
- **dry-run-11-12**: Advanced configurations and state management

## ⚙️ Prerequisites

- **Terraform** (>= 1.0)
- **Docker** and **Docker Compose**
- **AWS CLI** (optional, for AWS configuration)
- **LocalStack** (runs via Docker Compose)

## 🚀 Quick Start

### 1. Start LocalStack

LocalStack provides a local AWS development environment for testing without incurring cloud costs.

```bash
docker-compose -f localstack-docker-compose.yml up -d
```

Verify LocalStack is running:
```bash
docker-compose -f localstack-docker-compose.yml ps
```

### 2. Initialize Terraform

Navigate to any dry-run folder and initialize:

```bash
cd dry-run-12
terraform init
```

### 3. Plan Your Infrastructure

Preview the resources to be created:

```bash
terraform plan
```

Or use a variables file:

```bash
terraform plan -var-file="terraform.tfvars"
```

### 4. Apply Configuration

Deploy the infrastructure:

```bash
terraform apply
```

### 5. View Outputs

Retrieve output values:

```bash
terraform output
```

Specific output:
```bash
terraform output <output_name>
```

## 📖 Common Terraform Commands

```bash
# Initialize working directory
terraform init

# Format code
terraform fmt -recursive

# Validate configuration syntax
terraform validate

# Plan changes
terraform plan

# Apply changes
terraform apply

# Destroy resources
terraform destroy

# Show state
terraform show

# List resources in state
terraform state list

# Inspect specific resource
terraform state show <resource_address>
```

## 🔑 LocalStack Configuration

LocalStack overrides are specified in `localstack-overrinde.tf` files in relevant dry-run folders. These ensure Terraform provisions resources to LocalStack instead of actual AWS:

```hcl
provider "aws" {
  region            = "us-east-1"
  access_key        = "test"
  secret_key        = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  
  endpoints {
    ec2 = "http://localhost:4566"
    # Other service endpoints...
  }
}
```

## 📝 Tips & Best Practices

- **Variables**: Use `.tfvars` files for sensitive data or environment-specific values
- **Modules**: Organize reusable components in modules subdirectories
- **State Files**: `.tfstate` files track resources; keep them secure and backed up
- **Outputs**: Define outputs for frequently accessed resource attributes
- **Documentation**: Each dry-run includes a `terraform.tf` with provider configuration

## 🧹 Cleanup

To remove all provisioned resources:

```bash
cd <dry-run-folder>
terraform destroy
```

To stop LocalStack:

```bash
docker-compose -f localstack-docker-compose.yml down
```

## 📌 Notes

- Each dry-run is independent; you can work on multiple folders simultaneously
- Some folders contain `.tfstate` and `.tfstate.backup` files—these are snapshots of infrastructure state
- Sensitive data should use `terraform.tfvars` or environment variables, never hardcoding secrets
- Use `terraform workspace` for managing multiple environments within the same configuration

## 🔗 Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [LocalStack Documentation](https://docs.localstack.cloud/)

---

Happy learning! 🎓
