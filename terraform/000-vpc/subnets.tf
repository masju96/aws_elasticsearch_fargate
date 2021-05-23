resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = merge(
    {
      "Name" = "maj-vpc-main-public-subnet"
    },
    local.tags
  )
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr

  tags = merge(
    {
      "Name" = "maj-vpc-main-private-subnet"
    },
    local.tags
  )
}