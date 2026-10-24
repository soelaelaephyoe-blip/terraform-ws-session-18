# Backend Public Security Group 01
output "be_public_sg01_id" {
  description = "ID of backend public security group 01"
  value       = aws_security_group.be_public_sg01.id
}

output "be_public_sg01_name" {
  description = "Name of backend public security group 01"
  value       = aws_security_group.be_public_sg01.name
}

output "be_public_sg01_vpc_id" {
  description = "VPC ID of backend public security group 01"
  value       = aws_security_group.be_public_sg01.vpc_id
}

# Backend Private Security Group 01
output "be_private_sg01_id" {
  description = "ID of backend private security group 01"
  value       = aws_security_group.be_private_sg01.id
}

output "be_private_sg01_name" {
  description = "Name of backend private security group 01"
  value       = aws_security_group.be_private_sg01.name
}

output "be_private_sg01_vpc_id" {
  description = "VPC ID of backend private security group 01"
  value       = aws_security_group.be_private_sg01.vpc_id
}

# Backend Private Security Group 02
output "be_private_sg02_id" {
  description = "ID of backend private security group 02"
  value       = aws_security_group.be_private_sg02.id
}

output "be_private_sg02_name" {
  description = "Name of backend private security group 02"
  value       = aws_security_group.be_private_sg02.name
}

output "be_private_sg02_vpc_id" {
  description = "VPC ID of backend private security group 02"
  value       = aws_security_group.be_private_sg02.vpc_id
}

# Backend Private Security Group 03
output "be_private_sg03_id" {
  description = "ID of backend private security group 03"
  value       = aws_security_group.be_private_sg03.id
}

output "be_private_sg03_name" {
  description = "Name of backend private security group 03"
  value       = aws_security_group.be_private_sg03.name
}

output "be_private_sg03_vpc_id" {
  description = "VPC ID of backend private security group 03"
  value       = aws_security_group.be_private_sg03.vpc_id
}