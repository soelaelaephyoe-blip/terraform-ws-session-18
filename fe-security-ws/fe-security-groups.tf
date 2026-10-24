resource "aws_security_group" "fe_public_sg01" {
  name   = "${var.frontend_prefix}-public-security-group01"
  vpc_id = data.tfe_outputs.fe-network.nonsensitive_values["frontend_vpc_id"]

  tags = {
    Name = "${var.frontend_prefix}-public-security-group01"
  }
}
resource "aws_vpc_security_group_ingress_rule" "fe_public_sg01_allow_ssh" {
  security_group_id = aws_security_group.fe_public_sg01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Allow SSH "
}
resource "aws_vpc_security_group_ingress_rule" "fe_public_sg01_allow_icmp" {
  security_group_id = aws_security_group.fe_public_sg01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
  description       = "Allow inbound ping (ICMP Echo Request)"
}
resource "aws_vpc_security_group_ingress_rule" "fe_public_sg01_allow_http" {
  security_group_id = aws_security_group.fe_public_sg01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow inbound HTTP traffic"
}

resource "aws_vpc_security_group_ingress_rule" "fe_public_sg01_allow_https" {
  security_group_id = aws_security_group.fe_public_sg01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  description       = "Allow inbound HTTPS traffic"
}

resource "aws_vpc_security_group_egress_rule" "fe_public_sg01_allow_all_traffic" {
  security_group_id = aws_security_group.fe_public_sg01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}

resource "aws_security_group" "fe_private_sg01" {
  name   = "${var.frontend_prefix}-private-security-group01"
  vpc_id = data.tfe_outputs.fe-network.nonsensitive_values["frontend_vpc_id"]

  tags = {
    Name = "${var.frontend_prefix}-private-security-group01"
  }
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg01_allow_ssh" {
  security_group_id            = aws_security_group.fe_private_sg01.id
  referenced_security_group_id = aws_security_group.fe_public_sg01.id

  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg01_allow_icmp" {
  security_group_id            = aws_security_group.fe_private_sg01.id
  referenced_security_group_id = aws_security_group.fe_public_sg01.id

  from_port   = 8
  ip_protocol = "icmp"
  to_port     = 0
}

resource "aws_vpc_security_group_egress_rule" "fe_private_sg01_allow_all_traffic" {
  security_group_id = aws_security_group.fe_private_sg01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
#############################################################
resource "aws_security_group" "fe_private_sg02" {
  name = "${var.frontend_prefix}-private-security-group02"

  vpc_id = data.tfe_outputs.fe-network.nonsensitive_values["frontend_vpc_id"]

  tags = {
    Name = "${var.frontend_prefix}-private-security-group02"
  }
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg02_allow_ssh_from_fe_private_sg01" {
  security_group_id            = aws_security_group.fe_private_sg02.id
  referenced_security_group_id = aws_security_group.fe_private_sg01.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg02_allow_icmp_from_fe_private_sg01" {
  security_group_id            = aws_security_group.fe_private_sg02.id
  referenced_security_group_id = aws_security_group.fe_private_sg01.id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

# Ingress: Allow SSH from backend
resource "aws_vpc_security_group_ingress_rule" "fe_private_sg02_allow_ssh_from_be_private_sg02" {
  security_group_id = aws_security_group.fe_private_sg02.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg02_id"]

  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

# Ingress: Allow ICMP Ping from backend
resource "aws_vpc_security_group_ingress_rule" "fe_private_sg02_allow_icmp_from_be_private_sg02" {
  security_group_id = aws_security_group.fe_private_sg02.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg02_id"]

  from_port   = 8
  ip_protocol = "icmp"
  to_port     = 0
}

# Egress: Allow SSH to backend
resource "aws_vpc_security_group_egress_rule" "fe_private_sg02_allow_ssh_to_be_private_sg02" {
  security_group_id = aws_security_group.fe_private_sg02.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg02_id"]

  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

# Egress: Allow ICMP Ping to backend
resource "aws_vpc_security_group_egress_rule" "fe_private_sg02_allow_icmp_to_be_private_sg02" {
  security_group_id = aws_security_group.fe_private_sg02.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg02_id"]

  from_port   = 8
  ip_protocol = "icmp"
  to_port     = 0
}
#############################################################
resource "aws_security_group" "fe_private_sg03" {
  name = "${var.frontend_prefix}-private-security-group03"

  vpc_id = data.tfe_outputs.fe-network.nonsensitive_values["frontend_vpc_id"]

  tags = {
    Name = "${var.frontend_prefix}-private-security-group03"
  }
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg03_allow_ssh_from_fe_private_sg01" {
  security_group_id            = aws_security_group.fe_private_sg03.id
  referenced_security_group_id = aws_security_group.fe_private_sg01.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg03_allow_icmp_from_fe_private_sg01" {
  security_group_id            = aws_security_group.fe_private_sg03.id
  referenced_security_group_id = aws_security_group.fe_private_sg01.id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

# Ingress: Allow SSH from backend SG03
resource "aws_vpc_security_group_ingress_rule" "fe_private_sg03_allow_ssh_from_be_private_sg03" {
  security_group_id = aws_security_group.fe_private_sg03.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg03_id"]

  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

# Ingress: Allow ICMP Ping from backend SG03
resource "aws_vpc_security_group_ingress_rule" "fe_private_sg03_allow_icmp_from_be_private_sg03" {
  security_group_id = aws_security_group.fe_private_sg03.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg03_id"]

  from_port   = 8
  ip_protocol = "icmp"
  to_port     = 0
}

# Egress: Allow SSH to backend SG03
resource "aws_vpc_security_group_egress_rule" "fe_private_sg03_allow_ssh_to_be_private_sg03" {
  security_group_id = aws_security_group.fe_private_sg03.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg03_id"]

  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

# Egress: Allow ICMP Ping to backend SG03
resource "aws_vpc_security_group_egress_rule" "fe_private_sg03_allow_icmp_to_be_private_sg03" {
  security_group_id = aws_security_group.fe_private_sg03.id

  referenced_security_group_id = data.tfe_outputs.be_security.nonsensitive_values["be_private_sg03_id"]

  from_port   = 8
  ip_protocol = "icmp"
  to_port     = 0
}