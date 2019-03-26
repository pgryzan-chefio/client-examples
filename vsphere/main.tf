///////////////////////////////////////////////////////////////////////////////////////////////
//  
//  File Name:      client-examples/vsphere/main.tf
//  Created By:     Patrick Gryzan, pgryzan@chef.io
//  Date:           03/26/19
//  Comments:       This file defines the terraform actions to perform to create the infrastucture
//  
///////////////////////////////////////////////////////////////////////////////////////////////


provider "vsphere" {
    user                    = "${var.vsphere["user"]}"
    password                = "${var.vsphere["password"]}"
    vsphere_server          = "${var.vsphere["server"]}"

    # If you have a self-signed cert
    allow_unverified_ssl    = "${var.vsphere["allow_unverified_ssl"]}"
}

data "vsphere_datacenter" "dc" {
    name                    = "dc1"
}

data "vsphere_datastore" "datastore" {
    name                    = "datastore1"
    datacenter_id           = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
    name                    = "cluster1/Resources"
    datacenter_id           = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
    name                    = "public"
    datacenter_id           = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
    name                    = "demo"
    resource_pool_id        = "${data.vsphere_resource_pool.pool.id}"
    datastore_id            = "${data.vsphere_datastore.datastore.id}"

    num_cpus                = "${var.instance["num_cpus"]}"
    memory                  = "${var.instance["memory"]}"
    guest_id                = "${var.instance["guest_id"]}"

    network_interface {
        network_id          = "${data.vsphere_network.network.id}"
    }

    disk {
        label               = "disk0"
        size                = "${var.disk_size}"
    }
}