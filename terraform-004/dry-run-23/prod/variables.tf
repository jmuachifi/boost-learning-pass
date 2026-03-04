# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "This is the cloud hosting region where your webapp will be deployed."
}

variable "dev_prefix" {
  description = "This is the environment where your webapp is deployed. qa, prod, or dev"
}

variable "prod_prefix" {
  description = "This is the environment where your webapp is deployed. qa, prod, or dev"
}

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  default     = "us-west-2"
}