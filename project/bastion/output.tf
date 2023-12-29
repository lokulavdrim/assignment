output "bastion_public_cidr" {
  value = aws_instance.bastion_host.public_ip
}
