# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.24.1"
    }
  }
  required_version = ">= 0.15.2"
}

locals {
  security_groups = {
    sg_ping = aws_security_group.sg_ping.id,
    sg_8080 = aws_security_group.sg_8080.id,
  }
}


# provider "aws" {
#   region = var.region
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_instance" "web_app" {
  for_each               = local.security_groups
  ami                    = "ami-12c6146b" # Use a mock AMI ID for LocalStack
  instance_type          = "t2.micro"
  vpc_security_group_ids = [each.value]
  user_data              = file("script-data.sh")
  tags = {
    Name = "${var.name}-learn-${each.key}"
  }
}


resource "aws_security_group" "sg_ping" {
  name = "Allow Ping"

  # ingress {
  #   from_port       = -1
  #   to_port         = -1
  #   protocol        = "icmp"
  #   security_groups = [aws_security_group.sg_8080.id]
  # }
}

resource "aws_security_group" "sg_8080" {
  name = "Allow 8080"

  # ingress {
  #   from_port       = 8080
  #   to_port         = 8080
  #   protocol        = "tcp"
  #   security_groups = [aws_security_group.sg_ping.id]
  # }
  // connectivity to ubuntu mirrors is required to run `apt-get update` and `apt-get install apache2`
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow_ping" {
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  security_group_id        = aws_security_group.sg_ping.id
  source_security_group_id = aws_security_group.sg_8080.id
}

resource "aws_security_group_rule" "allow_8080" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg_8080.id
  source_security_group_id = aws_security_group.sg_ping.id
}

# resource "aws_security_group_rule" "allow_localhost_8080" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
#   security_group_id = aws_security_group.sg_8080.id
# }

# resource "aws_security_group_rule" "allow_localhost_ping" {
#   type              = "ingress"
#   from_port         = -1
#   to_port           = -1
#   protocol          = "icmp"
#   cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
#   security_group_id = aws_security_group.sg_ping.id
# }



