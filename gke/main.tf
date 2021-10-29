resource "google_container_cluster"  "my_cluster" {
  
  name                       = "my-gke-cluster"
  location                   = var.location
  project                    = var.project  
  network                    = var.network
  subnetwork                 = var.subnetwork
  description                = "Application cluster for container orchestrated app"
  #default_max_pods_per_node = 
  #enable_tpu                =
  #enable_autopilot          = false
  
  #Adding this block enables IP aliasing, making the cluster VPC-native instead of routes-based
  #ip_allocation_policy      =
  enable_legacy_abac         = false
  remove_default_node_pool   = true
  initial_node_count         = 3
  cluster_ipv4_cidr          = "10.96.0.0/14"
  
   #master_auth {
   #        client_certificate     = 
   #        client_key             = 
   #        cluster_ca_certificate = 
   #        password               = 
   #        username               =  
  
  #cluster_autoscaling       = 
  networking_mode            = "ROUTES"

  #logging_config            =
  logging_service            = "logging.googleapis.com/kubernetes"
  #labels
  #min_master_version
  node_locations = [
    "us-central1-c",
  ]
}


resource "google_container_node_pool"    "my_cluster_node_pool" {
  
  name                   = "my-node-pool"
  cluster                = google_container_cluster.my_cluster.id
  node_count             = 3
  project                = var.project  
  #version               = 
  node_config   {
    preemptible        = true
    machine_type       = "e2-medium"
    #disk_size_gb      = 
    #disk_type         = 
    #guest_accelerator = 
    #image_type        = 
    #labels            = 
    #local_ssd_count   = 
    #metadata          = 
    # service_account   =
    #shielded_instance_config {
    #           enable_integrity_monitoring = (known after apply)
    #           enable_secure_boot          = (known after apply)
    #        }
    
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #service_account = "google_service_account.446991545978-compute@developer.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
