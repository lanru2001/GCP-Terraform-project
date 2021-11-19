# Terraform script to deploy gke private cluster 
resource "google_container_cluster"  "my_cluster" {
  
  name                       = var.name
  location                   = var.location
  project                    = var.project  
  network                    = var.network
  subnetwork                 = var.subnetwork
  networking_mode            = "VPC_NATIVE" 
  description                = "Application cluster for container orchestrated app"
  #remove_default_node_pool   = true
  initial_node_count         = 3

  release_channel {
     channel = "REGULAR"

  }

  private_cluster_config {

    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block = "172.16.0.0/28"  

  }
  
  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true

  }

  ip_allocation_policy {
  
    cluster_secondary_range_name  = ""          
    services_secondary_range_name = ""  
  }
  
  
  #Adding this block enables IP aliasing, making the cluster VPC-native instead of routes-based
  enable_legacy_abac         = false
  logging_service            = "logging.googleapis.com/kubernetes"
  
}

resource "google_container_node_pool"  "my_cluster_node_pool" {
  
  name                   = "my-node-pool"
  cluster                = google_container_cluster.my_cluster.id
  node_count             = 3
  project                = var.project  
  location               = var.region  


  node_config   {
    preemptible        = true
    machine_type       = "e2-medium"
    disk_size_gb       = 20
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    #labels            = 
    local_ssd_count    = 0
    #metadata          = 
    
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #service_account = "google_service_account.446991545978-compute@developer.gserviceaccount.com"
    oauth_scopes = [
       "https://www.googleapis.com/auth/cloud-platform",
       "https://www.googleapis.com/auth/logging.write",
       "https://www.googleapis.com/auth/monitoring"
    ]
  } 
}  
