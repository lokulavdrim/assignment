output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_cidr" {
  value = aws_subnet.public_subnet.id
}
