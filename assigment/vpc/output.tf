output "public_subnet_id_output" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id_output" {
  value = aws_subnet.private_subnet.id
}
