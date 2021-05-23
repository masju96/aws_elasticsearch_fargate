
resource "aws_iam_service_linked_role" "es" {
    aws_service_name = "es.amazonaws.com"
}

resource "aws_iam_policy" "es_access_policy" {
  name        = "maj-es-access-policy"
  path        = "/"
  description = "Access to ES domain"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain_name}/*"
        }
    ]
}
EOF
}

resource "aws_elasticsearch_domain" "es" {
    domain_name           = var.domain_name
    elasticsearch_version = "7.8"

    cluster_config {
        instance_type = "t2.small.elasticsearch"
    }

    vpc_options {
        subnet_ids = [
            #Only private subnet
            data.terraform_remote_state.vpc.outputs.subnets_ids[1]
        ]

        security_group_ids = [aws_security_group.es.id]
    }

    access_policies = aws_iam_policy.es_access_policy

    snapshot_options {
        automated_snapshot_start_hour = 23
    }

    log_publishing_options {
        cloudwatch_log_group_arn = aws_cloudwatch_log_group.example.arn
        log_type                 = "AUDIT"
    }

    tags = merge(
        {
            "Name" = var.domain_name
        },
        local.tags
    )

    depends_on = [aws_iam_service_linked_role.es]
}