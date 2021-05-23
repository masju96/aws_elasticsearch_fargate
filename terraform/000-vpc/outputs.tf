output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "subnets_ids" {
  value = [aws_subnet.public.id, aws_subnet.private.id]
}

output "public_cidr" {
  value = var.public_subnet_cidr
}

output "private_cidr" {
  value = var.private_subnet_cidr
}
