provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  cidr               = var.vpc_cidr_block
  enable_nat_gateway = true
  enable_vpn_gateway = var.enable_vpn_gateway
  private_subnets    = slice(var.private_subnet_cidr_blocks, 0, var.private_subnet_count)
  public_subnets     = slice(var.public_subnet_cidr_blocks, 0, var.public_subnet_count)

  tags = var.resource_tags

}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.0.0"

  for_each      = toset([for i in range(var.instance_count) : tostring(i)])
  instance_type = var.ec2_instance_type

}
module "app_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/web"
  version = "3.0.0"

  vpc_id = module.vpc.vpc_id
  name   = "web-sg-${var.resource_tags["Project"]}-${var.resource_tags["Environment"]}"

}
module "lb_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/web"
  version = "3.0.0"

  vpc_id = module.vpc.vpc_id
  name   = "lb-sg-${var.resource_tags["Project"]}-${var.resource_tags["Environment"]}"
}
 module "elb_http" {
   source  = "terraform-aws-modules/elb/aws"
    version = "3.0.0"

  name               = "web-elb-${var.resource_tags["Project"]}-${var.resource_tags["Environment"]}"
  subnets            = module.vpc.public_subnets
 }