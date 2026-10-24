data "tfe_outputs" "be_network" {
  organization = "soe-hands-on-tf"
  workspace    = "be-network-ws"
}
data "tfe_outputs" "fe_security" {
  organization = "soe-hands-on-tf"
  workspace    = "fe-security-ws"
}