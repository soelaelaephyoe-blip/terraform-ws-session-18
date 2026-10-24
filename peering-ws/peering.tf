resource "aws_vpc_peering_connection" "fevpc_peering_bevpc" {
  vpc_id = data.tfe_outputs.fe_network.nonsensitive_values["frontend_vpc_id"]

  peer_vpc_id = data.tfe_outputs.be_network.nonsensitive_values["backend_vpc_id"]
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  #   tags = {
  #     Side = "Requester"
  #   }
}

resource "aws_route" "fevpc_private_subnet02_to_bevpc" {
  route_table_id = data.tfe_outputs.fe_network.nonsensitive_values[
    "frontend_private_route_table02_id"
  ]

  destination_cidr_block = data.tfe_outputs.be_network.nonsensitive_values[
    "backend_vpc_cidr_block"
  ]

  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "bevpc_private_subnet02_to_fevpc" {
  route_table_id = data.tfe_outputs.be_network.nonsensitive_values[
    "backend_private_route_table02_id"
  ]

  destination_cidr_block = data.tfe_outputs.fe_network.nonsensitive_values[
    "frontend_vpc_cidr_block"
  ]

  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "fevpc_private_subnet03_to_bevpc" {
  route_table_id = data.tfe_outputs.fe_network.nonsensitive_values[
    "frontend_private_route_table03_id"
  ]

  destination_cidr_block = data.tfe_outputs.be_network.nonsensitive_values[
    "backend_vpc_cidr_block"
  ]

  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "bevpc_private_subnet03_to_fevpc" {
  route_table_id = data.tfe_outputs.be_network.nonsensitive_values[
    "backend_private_route_table03_id"
  ]

  destination_cidr_block = data.tfe_outputs.fe_network.nonsensitive_values[
    "frontend_vpc_cidr_block"
  ]

  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}