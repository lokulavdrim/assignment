resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidr  
  availability_zone = "us-east-1b"             
  map_public_ip_on_launch = false

}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr  
  availability_zone = "us-east-1a"           
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
 
}

output "public_subnet_cidr" {
  value = aws_subnet.public_subnet.cidr_block
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}


output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "vpc_cidr" {
  value = aws_vpc.my_vpc.cidr_block
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
