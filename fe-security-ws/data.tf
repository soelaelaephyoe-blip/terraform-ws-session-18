data "tfe_outputs" "fe-network" {
  organization = "soe-hands-on-tf"
  workspace    = "fe-network-ws"
}
data "tfe_outputs" "be_security" {
  organization = "soe-hands-on-tf"
  workspace    = "be-security-ws"
}