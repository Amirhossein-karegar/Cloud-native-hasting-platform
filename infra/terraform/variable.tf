variable "vsphere_user" {
  type        = string
  description = "vCenter username"
}

variable "vsphere_password" {
  type        = string
  description = "vCenter password"
  sensitive   = true
}

variable "vsphere_server" {
  type        = string
  description = "vCenter server address"
}

