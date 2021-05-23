terraform {
  required_version = ">= 0.15.3"
  backend "s3" {
    bucket = "maj-terraform-backend"
    key    = "vpc/terraform.state"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}
