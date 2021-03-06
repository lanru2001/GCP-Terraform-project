# Terraform configuration of compute engine(VM )
resource "google_compute_instance" "web_server" {
    name         = var.vm_name
    machine_type = var.machine_type
    zone         = var.zone
    project      = var.project

    tags         = var.tags
  
    # Ensure firewall rule is provisioned before server, so that SSH doesn't fail.
    depends_on = [ google_compute_firewall.compute_firewall ]

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
       network                       = var.network          #"${google_compute_network.compute_network.name}"
       #subnetwork                   = var.subnetwork
       #subnetwork_project           = var.subnetwork_project

    }

    scheduling {
        automatic_restart           = true 
        on_host_maintenance         = "MIGRATE" 
        preemptible                 = false 

    }    

    metadata_startup_script         = file("startup.sh")
  
    #service_account {
    #   email  = var.email
    #   scopes = ["compute-ro"]
    #}
  
    #provisioner "remote-exec" {
    #  connection {
    #    host        = google_compute_address.static.address
    #    type        = "ssh"
    #    user        = var.user
    #    timeout     = "500s"
    #    private_key = file(var.privatekeypath)
    #  }
    #}  
}

