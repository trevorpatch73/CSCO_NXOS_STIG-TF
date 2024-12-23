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


resource "nxos_rest" "vlan44" {
  dn         = "sys/bd/bd-[vlan-44]"
  class_name = "l2BD"

  content = {
    fabEncap = "vlan-44"
    name     = "NATIVE_VLAN"
    adminSt  = "active"
    pcTag    = "1"
  }
}

resource "nxos_rest" "l1PhyIf_eth1_3" {
  dn         = "sys/intf/phys-[eth1/3]"
  class_name = "l1PhysIf"

  content = {
    adminSt     = "up"            
    layer       = "Layer2"        
    mode        = "trunk"        
    nativeVlan  = "vlan-44"      
  }

  depends_on = [
    nxos_rest.vlan44              
  ]
}

