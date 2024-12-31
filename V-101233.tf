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

resource "nxos_rest" "globalStpInst" {
  dn         = "sys/stp/inst"
  class_name = "stpInst"

  content = {
    ctrl        = "extchp-bpdu-guard"
  }
}


resource "nxos_rest" "stpIf_e1_1" {
  dn         = "sys/stp/inst/if-[eth1/1]"
  class_name = "stpIf"

  content = {
    bpduguard   = "enable"
    mode        = "edge"
  }
}

resource "nxos_rest" "stpIf_e1_2" {
  dn         = "sys/stp/inst/if-[eth1/2]"
  class_name = "stpIf"

  content = {
    bpduguard   = "enable"
    mode        = "edge"
  }
}

resource "nxos_spanning_tree_interface" "stpIf_e1_3" {
  interface_id = "eth1/3"
  bpdu_guard   = "enable"
  mode         = "edge"
}
resource "nxos_spanning_tree_interface" "stpIf_e1_4" {
  interface_id = "eth1/4"
  bpdu_guard   = "enable"
  mode         = "edge"
}
