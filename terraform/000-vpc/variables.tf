locals {
    tags = {
        Provider    = "Terraform",
        Component   = "vpc",
        Application = "aws_elasticsearch_fargate"
    }
}

variable "public_subnet_cidr" {
    default = "10.0.1.0/24"
    type = string
}

variable "private_subnet_cidr" {
    default = "10.0.2.0/24"
    type = string
}