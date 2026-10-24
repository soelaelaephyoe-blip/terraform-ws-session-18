output "fe_public_sg01" {
  description = "ID of frontend public security group 01"
  value       = aws_security_group.fe_public_sg01.id
}

output "fe_private_sg01" {
  description = "ID of frontend private security group 01"
  value       = aws_security_group.fe_private_sg01.id
}

output "fe_private_sg02" {
  description = "ID of frontend private security group 02"
  value       = aws_security_group.fe_private_sg02.id
}

output "fe_private_sg03" {
  description = "ID of frontend private security group 03"
  value       = aws_security_group.fe_private_sg03.id
}