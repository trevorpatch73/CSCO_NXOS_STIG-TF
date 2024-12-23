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

resource "nxos_rest" "spanEntity" {
  dn          = "sys/span"
  class_name  = "spanEntity"
  
  content = {
    adminSt = "enabled"
  }
}

resource "nxos_rest" "l1PhyIf" {
  dn         = "sys/intf/phys-[eth1/2]"
  class_name = "l1PhysIf"

  content = {
    adminSt  = "up"           
    layer    = "Layer2"       
    spanMode = "span-dest"    
  }
  
  depends_on = [
    nxos_rest.spanEntity
  ]  
}

resource "nxos_rest" "spanMonitor" {
  dn          = "sys/span/monitor-1"
  class_name  = "spanMonitor"
  
  content = {
    description       = "STIG v-101227"
    id                = "1"
    type              = "local"
    configState       = "up"
    destinationPorts  = "eth1/2"
  }
  
  depends_on = [
    nxos_rest.spanEntity,
    nxos_rest.monitor_port_eth1_2
  ]  
}

resource "nxos_rest" "spanSourceIntf" {
  dn          = "sys/span/monitor-1/srcintf-[eth1/1]"
  class_name  = "spanSourceIntf"

  content = {
    direction = "both"
    id        = "eth1/1"
  }
  
  depends_on = [
    nxos_rest.spanEntity,
    nxos_rest.monitor_port_eth1_2,  
    nxos_rest.spanMonitor
  ]  
  
}
