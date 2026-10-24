data "tfe_outputs" "fe_network" {
  organization = "soe-hands-on-tf"
  workspace    = "fe-network-ws"
}

data "tfe_outputs" "be_network" {
  organization = "soe-hands-on-tf"
  workspace    = "be-network-ws"
}