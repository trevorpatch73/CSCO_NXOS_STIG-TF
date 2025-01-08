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

resource "nxos_rest" "SC_ETH1_1" {
  dn         = "sys/intf/phys-[eth1/1]/physExtd"
  class_name = "l1PhysIfExtended"

  content = {
    stormCtrlAct        = "trap"
    stormCtrlBCastLevel = "10"
    stormCtrlMCastLevel = "20"
    stormCtrlUCastLevel = "70"
  }
}
