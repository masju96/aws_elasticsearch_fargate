resource "aws_security_group" "es" {
    name   = "${var.vpc}-elasticsearch-${var.domain}"
    vpc_id = data.aws_vpc.selected.id

    ingress {
        from_port = 443
        to_port   = 443
        protocol  = "tcp"

        cidr_blocks = [
            data.aws_vpc.selected.cidr_block,
        ]
    }

    tags = merge(
        {
            "Name" = var.security_group_name
        },
        local.tags
    )
}