/* Using aws_vpc_security_group_egress_rule and aws_vpc_security_group_ingress_rule resources is the current best practice. 
Avoid using the aws_security_group_rule resource and the ingress and egress arguments of the aws_security_group resource for configuring in-line rules, 
as they struggle with managing multiple CIDR blocks, and tags and descriptions due to the historical lack of unique IDs. */
resource "aws_security_group" "be_public_sg01" {
  name   = "${var.backend_prefix}-public-security-group01"
  vpc_id = data.tfe_outputs.be_network.nonsensitive_values["backend_vpc_id"]

  tags = {
    Name = "${var.backend_prefix}-public-security-group01"
  }
}
# SSH - Port 22
resource "aws_vpc_security_group_ingress_rule" "be_public_sg01_allow_ssh" {
  security_group_id = aws_security_group.be_public_sg01.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "Allow inbound SSH"
}

# ICMP - Ping
resource "aws_vpc_security_group_ingress_rule" "be_public_sg01_allow_icmp" {
  security_group_id = aws_security_group.be_public_sg01.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8
  to_port     = 0
  ip_protocol = "icmp"

  description = "Allow inbound ping (ICMP Echo Request)"
}

# HTTP - Port 80
resource "aws_vpc_security_group_ingress_rule" "be_public_sg01_allow_http" {
  security_group_id = aws_security_group.be_public_sg01.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow inbound HTTP"
}

# HTTPS - Port 443
resource "aws_vpc_security_group_ingress_rule" "be_public_sg01_allow_https" {
  security_group_id = aws_security_group.be_public_sg01.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "Allow inbound HTTPS"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "be_public_sg01_allow_all_outbound" {
  security_group_id = aws_security_group.be_public_sg01.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}

#############################################################
resource "aws_security_group" "be_private_sg01" {
  name = "${var.backend_prefix}-private-security-group01"

  vpc_id = data.tfe_outputs.be_network.nonsensitive_values["backend_vpc_id"]

  tags = {
    Name = "${var.backend_prefix}-private-security-group01"
  }
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg01_allow_ssh" {
  security_group_id            = aws_security_group.be_private_sg01.id
  referenced_security_group_id = aws_security_group.be_public_sg01.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg01_allow_icmp" {
  security_group_id            = aws_security_group.be_private_sg01.id
  referenced_security_group_id = aws_security_group.be_public_sg01.id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg01_allow_all_traffic" {
  security_group_id = aws_security_group.be_private_sg01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
#############################################################
resource "aws_security_group" "be_private_sg02" {
  name = "${var.backend_prefix}-private-security-group02"

  vpc_id = data.tfe_outputs.be_network.nonsensitive_values["backend_vpc_id"]

  tags = {
    Name = "${var.backend_prefix}-private-security-group02"
  }
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg02_allow_ssh_from_be_private_sg01" {
  security_group_id            = aws_security_group.be_private_sg02.id
  referenced_security_group_id = aws_security_group.be_private_sg01.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg02_allow_icmp_from_be_private_sg01" {
  security_group_id            = aws_security_group.be_private_sg02.id
  referenced_security_group_id = aws_security_group.be_private_sg01.id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}
# # Ingress: Allow SSH from frontend SG02
# resource "aws_vpc_security_group_ingress_rule" "be_private_sg02_allow_ssh_from_fe_private_sg02" {
#   security_group_id = aws_security_group.be_private_sg02.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg02"]

#   from_port   = 22
#   ip_protocol = "tcp"
#   to_port     = 22
# }

# # Ingress: Allow ICMP Ping from frontend SG02
# resource "aws_vpc_security_group_ingress_rule" "be_private_sg02_allow_icmp_from_fe_private_sg02" {
#   security_group_id = aws_security_group.be_private_sg02.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg02"]

#   from_port   = 8
#   ip_protocol = "icmp"
#   to_port     = 0
# }

# # Egress: Allow SSH to frontend SG02
# resource "aws_vpc_security_group_egress_rule" "be_private_sg02_allow_ssh_to_fe_private_sg02" {
#   security_group_id = aws_security_group.be_private_sg02.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg02"]

#   from_port   = 22
#   ip_protocol = "tcp"
#   to_port     = 22
# }

# # Egress: Allow ICMP Ping to frontend SG02
# resource "aws_vpc_security_group_egress_rule" "be_private_sg02_allow_icmp_to_fe_private_sg02" {
#   security_group_id = aws_security_group.be_private_sg02.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg02"]

#   from_port   = 8
#   ip_protocol = "icmp"
#   to_port     = 0
# }
#############################################################
resource "aws_security_group" "be_private_sg03" {
  name = "${var.backend_prefix}-private-security-group03"

  vpc_id = data.tfe_outputs.be_network.nonsensitive_values["backend_vpc_id"]

  tags = {
    Name = "${var.backend_prefix}-private-security-group03"
  }
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg03_allow_ssh_from_be_private_sg01" {
  security_group_id            = aws_security_group.be_private_sg03.id
  referenced_security_group_id = aws_security_group.be_private_sg01.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg03_allow_icmp_from_be_private_sg01" {
  security_group_id            = aws_security_group.be_private_sg03.id
  referenced_security_group_id = aws_security_group.be_private_sg01.id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}
# Ingress: Allow SSH from frontend SG03
# resource "aws_vpc_security_group_ingress_rule" "be_private_sg03_allow_ssh_from_fe_private_sg03" {
#   security_group_id = aws_security_group.be_private_sg03.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg03"]

#   from_port   = 22
#   ip_protocol = "tcp"
#   to_port     = 22
# }

# # Ingress: Allow ICMP Ping from frontend SG03
# resource "aws_vpc_security_group_ingress_rule" "be_private_sg03_allow_icmp_from_fe_private_sg03" {
#   security_group_id = aws_security_group.be_private_sg03.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg03"]

#   from_port   = 8
#   ip_protocol = "icmp"
#   to_port     = 0
# }

# # Egress: Allow SSH to frontend SG03
# resource "aws_vpc_security_group_egress_rule" "be_private_sg03_allow_ssh_to_fe_private_sg03" {
#   security_group_id = aws_security_group.be_private_sg03.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg03"]

#   from_port   = 22
#   ip_protocol = "tcp"
#   to_port     = 22
# }

# # Egress: Allow ICMP Ping to frontend SG03
# resource "aws_vpc_security_group_egress_rule" "be_private_sg03_allow_icmp_to_fe_private_sg03" {
#   security_group_id = aws_security_group.be_private_sg03.id

#   referenced_security_group_id = data.tfe_outputs.fe_security.nonsensitive_values["fe_private_sg03"]

#   from_port   = 8
#   ip_protocol = "icmp"
#   to_port     = 0
# }