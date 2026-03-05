# Terraform Learning Pass 004

Hands-on Terraform exercises using AWS resources on LocalStack.  
Each `dry-run-*` folder is a standalone scenario you can run independently.

## What You Learn

- Terraform basics: providers, variables, outputs, and state
- Resource lifecycle: `plan`, `apply`, `destroy`
- Module design and reuse
- Local AWS simulation with LocalStack
- Managing configuration through `terraform.tfvars`

## Repository Layout

```text
terraform-004/
├── localstack-docker-compose.yml
├── README.md
├── dry-run-00 ... dry-run-12/
└── scripts/
```

## Dry-Run Progression

- `dry-run-00` to `dry-run-03`: foundational Terraform syntax and structure
- `dry-run-04`: architecture notes and extended provisioning
- `dry-run-05`: first reusable module (`modules/aws-ec2-instance`)
- `dry-run-06`: variable overrides with `terraform.tfvars`
- `dry-run-07` to `dry-run-10`: user data/scripts + module-driven builds
- `dry-run-11` and `dry-run-12`: more advanced composition/state practice

## Prerequisites

- Terraform 1.x
- Docker Desktop (or Docker Engine) with Compose support
- Optional: AWS CLI

## Quick Start

1) Start LocalStack from repository root:

```bash
docker compose -f localstack-docker-compose.yml up -d
```

2) Pick a scenario and initialize Terraform:

```bash
cd dry-run-12
terraform init
```

3) Validate and preview changes:

```bash
terraform validate
terraform plan
```

4) Apply and inspect outputs:

```bash
terraform apply
terraform output
```

5) Clean up when done:

```bash
terraform destroy
```

## Common Commands

```bash
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform output
terraform state list
terraform destroy
```

## Notes on LocalStack

- Several folders include `localstack-overrinde.tf` (filename kept as-is in this repo).
- Those files redirect AWS provider endpoints to LocalStack (`http://localhost:4566`).
- Test credentials are typically used (`access_key = "test"`, `secret_key = "test"`).

## Tips

- Treat each `dry-run-*` directory as independent unless explicitly linked.
- Keep secrets in `*.tfvars` files or environment variables, not hardcoded in `.tf` files.
- Don’t share `.tfstate` files outside trusted environments.

## Troubleshooting

- LocalStack not reachable: verify `docker compose ps` and check port `4566`.
- Provider/plugin issues: run `terraform init -upgrade`.
- Unexpected state behavior: inspect with `terraform state list` and `terraform show`.

## References

- Terraform: https://developer.hashicorp.com/terraform/docs
- AWS Provider: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- LocalStack: https://docs.localstack.cloud/
