resource "google_container_cluster"  "my_cluster" {
  
  name                       = var.name
  location                   = var.location
  project                    = var.project  
  network                    = var.network
  subnetwork                 = var.subnetwork
  description                = "Application cluster for container orchestrated app"
 
  #ip_range_pods             = var.ip_range_pods
  #ip_range_services         = var.ip_range_services  
  
  # optional variables
  #kubernetes_version        = "1.20.9-gke.1001"  # "1.16.11-gke.5"
  #regional                  = true
  #create_service_account    = false
  
  
  #Adding this block enables IP aliasing, making the cluster VPC-native instead of routes-based
  enable_legacy_abac         = false
  remove_default_node_pool   = true
  initial_node_count         = 3
  
  addons_config {

        network_policy_config {
               disabled = true
        }
  }

  cluster_autoscaling {
            enabled = false
  }

  database_encryption {
             state = "DECRYPTED"
  }

  default_snat_status {
            disabled = false
  }

  logging_config {
        enable_components = [
            "SYSTEM_COMPONENTS",
            "WORKLOADS",
        ]
  }
  
  # addons
  #network_policy             = false
  #horizontal_pod_autoscaling = true
  #http_load_balancing        = true  
   #master_auth {
   #        client_certificate     = 
   #        client_key             = 
   #        cluster_ca_certificate = 
   #        password               = 
   #        username               =  
    

  networking_mode            = "ROUTES"  
  logging_service            = "logging.googleapis.com/kubernetes"
  
}

resource "google_container_node_pool"  "my_cluster_node_pool" {
  
  name                   = "my-node-pool"
  cluster                = google_container_cluster.my_cluster.id
  node_count             = 3
  project                = var.project  


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
