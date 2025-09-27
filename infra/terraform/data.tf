data "vsphere_datacenter" "dc" {
  name = "Nextera"
}

data "vsphere_host" "host" {
  name          = "172.17.80.124"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = "Store-2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
  name          = "Ubuntu-2404-LTS-Clone"
  datacenter_id = data.vsphere_datacenter.dc.id
}
