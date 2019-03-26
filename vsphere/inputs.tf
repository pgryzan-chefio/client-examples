///////////////////////////////////////////////////////////////////////////////////////////////
//  
//  File Name:      client-examples/vsphere/inputs.tf
//  Created By:     Patrick Gryzan, pgryzan@chef.io
//  Date:           03/26/19
//  Comments:       This file defines the terraform input variables
//  
///////////////////////////////////////////////////////////////////////////////////////////////

//  Keys - terraform.tfvars
variable "vsphere" {
    type            = "map"
    description     = "The vsphere provider key information"
}

variable "hab" {
    type            = "map"
    description     = "The habitat key information"
}

variable "windows" {
    type            = "map"
    description     = "The windows setup information"
}

//  VM
variable "instance" {
    default         = {
        num_cpus    = 2
        memory      = 1024
        guest_id    = "other3xLinux64Guest"
    }
    description     = "The size of the vm allocated hardware"
}

variable "disk_size" {
    default         = "100"
    description     = "The vm disk size in GB"
}