# Terraform configuration of compute engine(VM )
resource "google_compute_instance" "web_server" {
    name         = var.vm_name
    machine_type = var.machine_type
    zone         = var.zone
    project      = var.project

    tags         = var.tags

    boot_disk {
        auto_delete                 = true
        device_name                 = "persistent-disk-0" 
        mode                        = "READ_WRITE"

        initialize_params {
            image                   = var.image
            #labels                 = var.labels
            size                    = var.size
            type                    = var.type
        }
    }  

    network_interface {
       network                      = var.network
       subnetwork                   = var.subnetwork
       subnetwork_project           = var.subnetwork_project

    }

    scheduling {
        automatic_restart           = true 
        on_host_maintenance         = "MIGRATE" 
        preemptible                 = false 

    }    

    metadata_startup_script         = file("startup.sh")

}
