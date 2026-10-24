output "backend_vpc_id" {
  description = "ID of the backend VPC"
  value       = aws_vpc.backend_vpc.id
}

output "backend_vpc_cidr_block" {
  description = "CIDR block of the backend VPC"
  value       = aws_vpc.backend_vpc.cidr_block
}

# Public Subnet IDs
output "backend_public_subnet01_id" {
  description = "ID of backend public subnet 01"
  value       = aws_subnet.backend_public_subnet01.id
}

output "backend_public_subnet02_id" {
  description = "ID of backend public subnet 02"
  value       = aws_subnet.backend_public_subnet02.id
}

output "backend_public_subnet03_id" {
  description = "ID of backend public subnet 03"
  value       = aws_subnet.backend_public_subnet03.id
}

output "backend_public_subnet_ids" {
  description = "List of backend public subnet IDs"
  value = [
    aws_subnet.backend_public_subnet01.id,
    aws_subnet.backend_public_subnet02.id,
    aws_subnet.backend_public_subnet03.id
  ]
}

# Private Subnet IDs
output "backend_private_subnet01_id" {
  description = "ID of backend private subnet 01"
  value       = aws_subnet.backend_private_subnet01.id
}

output "backend_private_subnet02_id" {
  description = "ID of backend private subnet 02"
  value       = aws_subnet.backend_private_subnet02.id
}

output "backend_private_subnet03_id" {
  description = "ID of backend private subnet 03"
  value       = aws_subnet.backend_private_subnet03.id
}

output "backend_private_subnet_ids" {
  description = "List of backend private subnet IDs"
  value = [
    aws_subnet.backend_private_subnet01.id,
    aws_subnet.backend_private_subnet02.id,
    aws_subnet.backend_private_subnet03.id
  ]
}
# Public Route Tables
output "backend_public_route_table01_id" {
  description = "ID of backend public route table 01"
  value       = aws_route_table.backend_public_rtb.id
}

# Private Route Tables
output "backend_private_route_table01_id" {
  description = "ID of backend private route table 01"
  value       = aws_route_table.backend_private_rtb01.id
}

output "backend_private_route_table02_id" {
  description = "ID of backend private route table 02"
  value       = aws_route_table.backend_private_rtb02.id
}

output "backend_private_route_table03_id" {
  description = "ID of backend private route table 03"
  value       = aws_route_table.backend_private_rtb03.id
}
output "backend_private_route_table03_arn" {
  description = "ARN of backend private route table 03"
  value       = aws_route_table.backend_private_rtb03.arn
}