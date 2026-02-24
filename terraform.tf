terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.28.0"
    }
  }
    backend "remote" {
    organization = "xcloud-hashicorp-org"
    workspaces {
      name = "tf-xcloud"
    }
  }
}