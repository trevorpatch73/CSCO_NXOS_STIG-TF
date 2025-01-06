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

resource "nxos_rest" "switchportBlock_eth1_1" {
  dn         = "sys/intf/phys-[eth1/1]/physExtd"
  class_name = "l1PhysIfExtended"

  content = {
    switchportBlock   = "unicast"
  }
}

resource "nxos_rest" "switchportBlock_eth1_2" {
  dn         = "sys/intf/phys-[eth1/2]/physExtd"
  class_name = "l1PhysIfExtended"

  content = {
    switchportBlock   = "unicast"
  }
}
