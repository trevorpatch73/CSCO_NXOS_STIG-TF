terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
      version = "0.5.5"
    }
  }
}

provider "nxos" {
  username = "admin"
  password = "Admin_1234!"
  url      = "https://sbx-nxos-mgmt.cisco.com/"
  insecure = true
}

resource "nxos_physical_interface" "eth1_10" {
  interface_id             = "eth1/10"
  admin_state              = "up"
  auto_negotiation         = "on"
  description              = "ORCH:TF"
  duplex                   = "auto"
  layer                    = "Layer2"
  mode                     = "trunk"
  mtu                      = 1500
  speed                    = "auto"
  trunk_vlans              = "10,20,30,40"
}
