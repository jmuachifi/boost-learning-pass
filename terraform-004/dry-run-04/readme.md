# Terraform Sandbox

Sandbox URL: https://play.instruqt.com/manage/hashicorp-learn/tracks/terraform-sandbox

This sandbox contains preinstalled tools and services for you to experiment with Terraform. These tools include the Terraform CLI, Docker, LocalStack, and the AWS CLI.

In `main.tf`, you will find sample configuration that defines an EC2 instance and outputs the instance's ID. Use Terraform to initialize, plan, and apply the configuration. You can modify the configuration and re-apply the configuration to experiment with Terraform's functionality.

## Using LocalStack

LocalStack is a local AWS emulator. You can use Terraform and AWS CLI against LocalStack to test your configuration and simulate AWS resource deployments. This sandbox includes a file named `localstack_overrides.tf` that configures the AWS provider in your configuration to point to LocalStack instead of trying to reach AWS. For the limitations of what APIs you can call using LocalStack, refer to the [LIMITATIONS.md](LIMITATIONS.md) file.

## Using AWS

If you would like to deploy resources to AWS, delete the `localstack_overrides.tf` file and configure the AWS provider using the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.

**NOTE:** Once the timer on the sandbox expires, this environment will be halted. If you have any resources managed by a local state file, this sandbox will not clean up those resources. Make sure to run `terraform destroy` before leaving the sandbox if you have configured the AWS provider to deploy real resources to your own AWS account.