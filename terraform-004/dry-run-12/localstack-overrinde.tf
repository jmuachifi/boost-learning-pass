# This file overrides the AWS provider configuration to
# use LocalStack. If you wish to deploy to your own AWS
# account, delete this file.

provider "aws" {
  access_key                  = "anaccesskey"
  secret_key                  = "asecretkey"
  region                      = var.aws_region
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "https://localhost.localstack.cloud:4566"
    apigatewayv2   = "https://localhost.localstack.cloud:4566"
    cloudformation = "https://localhost.localstack.cloud:4566"
    cloudwatch     = "https://localhost.localstack.cloud:4566"
    dynamodb       = "https://localhost.localstack.cloud:4566"
    ec2            = "https://localhost.localstack.cloud:4566"
    elb            = "https://localhost.localstack.cloud:4566"
    elbv2          = "https://localhost.localstack.cloud:4566"
    es             = "https://localhost.localstack.cloud:4566"
    elasticache    = "https://localhost.localstack.cloud:4566"
    firehose       = "https://localhost.localstack.cloud:4566"
    iam            = "https://localhost.localstack.cloud:4566"
    kinesis        = "https://localhost.localstack.cloud:4566"
    lambda         = "https://localhost.localstack.cloud:4566"
    rds            = "https://localhost.localstack.cloud:4566"
    redshift       = "https://localhost.localstack.cloud:4566"
    route53        = "https://localhost.localstack.cloud:4566"
    s3             = "http://localhost.localstack.cloud:4566"
    secretsmanager = "https://localhost.localstack.cloud:4566"
    ses            = "https://localhost.localstack.cloud:4566"
    sns            = "https://localhost.localstack.cloud:4566"
    sqs            = "https://localhost.localstack.cloud:4566"
    ssm            = "https://localhost.localstack.cloud:4566"
    stepfunctions  = "https://localhost.localstack.cloud:4566"
    sts            = "https://localhost.localstack.cloud:4566"
  }
}