network_name                        = "vpc-network-dev"
network                             = "default"
#subnetwork                         = "prod"
#subnetwork_project                 = "My user project" 
auto_create_subnetworks             = true
machine_type                        = "e2-medium"
zone                                = "us-central1-c"
region                              = "us-central1"
tags                                = [ "allow-jenkins" ]
image                               = "centos-cloud/centos-7"
cluster_name                        = "app-cluster"
cluster_service_account_name        = "example-private-cluster-sa"
master_ipv4_cidr_block              = "10.5.0.0/28"
vpc_cidr_block                      = "10.3.0.0/16"
vpc_secondary_cidr_block            = "10.4.0.0/16"
