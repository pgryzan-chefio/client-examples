///////////////////////////////////////////////////////////////////////////////////////////////
//  
//  File Name:      client-examples/azure/outputs.tf
//  Created By:     Patrick Gryzan, pgryzan@chef.io
//  Date:           03/26/19
//  Comments:       This file defines the terraform output variables
//  
///////////////////////////////////////////////////////////////////////////////////////////////

output "windows" {
    value           = {
        ip          = "${azurerm_public_ip.azure_pip.ip_address}"
    }
}