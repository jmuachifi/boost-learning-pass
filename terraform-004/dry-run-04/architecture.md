# Architecture

This sandbox includes the following preinstalled tools and services:

- Terraform
- Docker
- LocalStack
- AWS CLI

## Terraform

The Terraform CLI is installed locally and placed in the environment's PATH. Run `terraform version` to check which version of Terraform is installed in this sandbox.

## Docker

Docker is already running with the default configuration. The Docker daemon socket file is located at `/var/run/docker.sock`.

## LocalStack

LocalStack is already running in the local Docker instance. Additionally, this sandbox includes a `localstack_override.tf` to automatically configure your AWS provider to point to LocalStack rather than AWS. You do not need to make any changes to your configuration to connect to LocalStack.

## AWS CLI

This sandbox has the `aws` command aliased to the `awslocal` CLI, the tool to make AWS CLI calls to LocalStack. You can use this tool just as you would the normal `aws` CLI. For example, the following command will communicate with LocalStack to get a list of the EC2 instances it currently has mocked.

```
aws ec2 describe-instances
```