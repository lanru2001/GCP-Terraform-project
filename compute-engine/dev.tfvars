project                 = "My user project" 
network_name            = "vpc-network-dev"
network                 = "default"
subnetwork              = "prod"
subnetwork_project      = "My user project" 
auto_create_subnetworks = true
vm_name                 = "jenkins-dev-server"
machine_type            = "e2-medium"
zone                    = "us-central1-c"
region                  = us-central1
tags                    = ["allow-jenkins"]
image                   = "centos-cloud/centos-7" 
#labels                 = ["function","log-server" ]
size                    = "10"
type                    = "pd-standard"
firewall_name           = "jenkins-dev"
ports                   = [ "22", "80", "8080" ]
protocol                = "tcp"
source_ranges           = [ "10.128.0.0/20" ]
target_tags             = ["allow-jenkins"]
email                   = lanretemitope7@gmail.com
