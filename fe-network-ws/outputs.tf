# VPC
output "frontend_vpc_id" {
  description = "ID of the frontend VPC"
  value       = aws_vpc.frontend_vpc.id
}

output "frontend_vpc_cidr_block" {
  description = "CIDR block of the frontend VPC"
  value       = aws_vpc.frontend_vpc.cidr_block
}

# Public Subnets
output "frontend_public_subnet01_id" {
  description = "ID of frontend public subnet 01"
  value       = aws_subnet.frontend_public_subnet01.id
}

output "frontend_public_subnet02_id" {
  description = "ID of frontend public subnet 02"
  value       = aws_subnet.frontend_public_subnet02.id
}

output "frontend_public_subnet03_id" {
  description = "ID of frontend public subnet 03"
  value       = aws_subnet.frontend_public_subnet03.id
}

output "frontend_public_subnet_ids" {
  description = "List of frontend public subnet IDs"
  value = [
    aws_subnet.frontend_public_subnet01.id,
    aws_subnet.frontend_public_subnet02.id,
    aws_subnet.frontend_public_subnet03.id
  ]
}

# Private Subnets
output "frontend_private_subnet01_id" {
  description = "ID of frontend private subnet 01"
  value       = aws_subnet.frontend_private_subnet01.id
}

output "frontend_private_subnet02_id" {
  description = "ID of frontend private subnet 02"
  value       = aws_subnet.frontend_private_subnet02.id
}

output "frontend_private_subnet03_id" {
  description = "ID of frontend private subnet 03"
  value       = aws_subnet.frontend_private_subnet03.id
}

output "frontend_private_subnet_ids" {
  description = "List of frontend private subnet IDs"
  value = [
    aws_subnet.frontend_private_subnet01.id,
    aws_subnet.frontend_private_subnet02.id,
    aws_subnet.frontend_private_subnet03.id
  ]
}
# Public Route Tables
output "frontend_public_route_table01_id" {
  description = "ID of frontend public route table 01"
  value       = aws_route_table.frontend_public_rtb.id
}

# Private Route Tables
output "frontend_private_route_table01_id" {
  description = "ID of frontend private route table 01"
  value       = aws_route_table.frontend_private_rtb01.id
}

output "frontend_private_route_table02_id" {
  description = "ID of frontend private route table 02"
  value       = aws_route_table.frontend_private_rtb02.id
}

output "frontend_private_route_table03_id" {
  description = "ID of frontend private route table 03"
  value       = aws_route_table.frontend_private_rtb03.id
}


