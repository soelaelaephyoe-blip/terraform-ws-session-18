data "tfe_outputs" "fe_network" {
  organization = "soe-hands-on-tf"
  workspace    = "fe-network-ws"
}

data "tfe_outputs" "fe_security" {
  organization = "soe-hands-on-tf"
  workspace    = "fe-security-ws"
}