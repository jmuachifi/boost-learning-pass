# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# provider "aws" {
#   region = "us-west-2"

#   default_tags {
#     tags = {
#       hashicorp-learn = "module-use"
#     }
#   }
# }

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  count   = 3

  name = "my-ec2-cluster-${count.index}"

  ami                    = "ami-12c6146b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
