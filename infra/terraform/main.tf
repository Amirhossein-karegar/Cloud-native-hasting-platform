resource "vsphere_virtual_machine" "vm" {
  name             = "Test1"
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  disk {
    label            = "disk0"
    size             = 25
    eagerly_scrub    = false
    thin_provisioned = true
  }

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "e1000"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "test1"
        domain    = "nextera.local"

      }

      network_interface {
        ipv4_address = "172.17.80.121"
        ipv4_netmask = 25

      }

      ipv4_gateway    = "172.17.80.126"
      dns_server_list = "172.17.80.125,8.8.8.8"
    }
  }
  firmware = "efi"
}
