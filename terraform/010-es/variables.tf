locals {
    tags = {
        Provider    = "Terraform",
        Component   = "vpc",
        Application = "aws_elasticsearch_fargate"
    }
}

variable "domain_name" {
    default = "maj-elasticsearch-cluster"
    type = string
}

variable "security_group_name" {
    default = "maj-elasticsearch-sg"
    type = string
}