#Google  vpc network 
resource "google_compute_network" "compute_network" {
  project                 = var.project
  name                    = var.network_name 
  auto_create_subnetworks = true
  mtu                     = 1460 # maximum transmission units in byte
}

#Google network firewall 
resource "google_compute_firewall"   "compute_firewall" {
  project                 = var.project
  name                    = "jenkins-firewall"
  network                 = var.network
  description             = "Creates firewall rule targeting tagged instances"
  
  depends_on = [ google_compute_network.compute_network ]
  
  allow {
    protocol              = var.protocol 
    ports                 = var.ports
  }
  source_ranges           = var.source_ranges
  target_tags             = var.target_tags
}
