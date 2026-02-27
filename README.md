# Boost Learning Pass

A comprehensive learning repository for cloud technologies, DevOps practices, and Infrastructure as Code (IaC) concepts.

## 📋 Overview

This repository serves as a structured learning path covering:
- **Azure DevOps (AZ-400)**: Certification preparation and practical examples
- **Terraform**: Progressive Infrastructure as Code exercises with AWS and LocalStack
- **DevOps Best Practices**: Real-world scenarios and implementation patterns

## 🗂️ Repository Structure

```
boost-learning-pass/
├── az-400/              # Azure DevOps AZ-400 certification materials
│   └── dentsu-percipio/ # Percipio learning resources
├── terraform-004/       # Terraform learning exercises (dry-runs 00-12)
└── terraform.tfstate.d/ # Terraform workspace state files
```

## 🚀 Getting Started

### Prerequisites

- **Git**: Version control system
- **Terraform**: >= 1.0 (for Terraform exercises)
- **Docker & Docker Compose**: For LocalStack simulation
- **Code Editor**: VS Code recommended with Terraform extension

### Clone the Repository

```bash
git clone <repository-url>
cd boost-learning-pass
```

## 📚 Learning Paths

### 1. Azure DevOps (AZ-400)

Navigate to the `az-400/` directory for certification study materials and practice exercises.

```bash
cd az-400/dentsu-percipio
```

### 2. Terraform Practice

The `terraform-004/` directory contains 13 progressive dry-run exercises (00-12) covering:
- Basic Terraform configuration
- Variables and outputs
- Module creation and usage
- AWS EC2 instance provisioning
- State management
- LocalStack integration for local testing

**Quick Start with Terraform:**

```bash
cd terraform-004

# Start LocalStack for local AWS simulation
docker-compose -f localstack-docker-compose.yml up -d

# Navigate to any dry-run folder
cd dry-run-00

# Initialize Terraform
terraform init

# Plan the infrastructure
terraform plan

# Apply the configuration
terraform apply
```

For detailed instructions on each Terraform exercise, see [terraform-004/README.md](terraform-004/README.md).

## 📖 Usage Instructions

### Working with Terraform Exercises

1. **Sequential Learning**: Start with `dry-run-00` and progress sequentially through `dry-run-12`
2. **Each dry-run is self-contained**: You can work on them individually
3. **LocalStack**: Use LocalStack for cost-free AWS resource testing
4. **State Files**: Some dry-runs include state files showing successful executions

### Terraform Workflow

```bash
# Step 1: Initialize the working directory
terraform init

# Step 2: Validate configuration
terraform validate

# Step 3: Plan the changes
terraform plan

# Step 4: Apply the configuration
terraform apply

# Step 5: Inspect outputs
terraform output

# Step 6: Clean up resources
terraform destroy
```

## 🛠️ Tools and Technologies

- **Terraform**: Infrastructure as Code
- **AWS**: Cloud provider (simulated via LocalStack)
- **LocalStack**: Local AWS cloud stack for development
- **Docker**: Containerization platform
- **PowerShell**: Scripting and automation
- **Git**: Version control

## 📝 Notes

- This is a **learning repository** - experiments and breaking changes are expected
- **State files** are included for reference but should not be committed in production
- Use **LocalStack** to avoid AWS charges during development
- Each module and dry-run has specific learning objectives

## 🔗 Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [LocalStack Documentation](https://docs.localstack.cloud/)
- [Azure DevOps Documentation](https://docs.microsoft.com/azure/devops/)

## 📄 License

See [LICENSE](LICENSE) file for details.

## 🤝 Contributing

This is a personal learning repository. Feel free to fork and adapt for your own learning journey!
