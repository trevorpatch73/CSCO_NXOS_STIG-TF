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

resource "nxos_rest" "IgmpSnoop" {
  dn         = "sys/igmpsnoop/inst/dom/gl/igmpsnbase"
  class_name = "igmpsnoopIgmpsnBase"

  content = {
    igmpSnoop   = "yes"
  }
}
