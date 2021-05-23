data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "maj-terraform-backend"
    key    = "vpc/terraform.state"
    region = "eu-west-1"
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}