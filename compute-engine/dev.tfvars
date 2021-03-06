project                 = "my-user-project-326713" 
network_name            = "vpc-network-dev"
network                 = "default"
#subnetwork             = "prod"
#subnetwork_project     = "My user project" 
auto_create_subnetworks = true
vm_name                 = "jenkins-dev-server"
machine_type            = "e2-medium"
zone                    = "us-central1-c"
region                  = "us-central1"
tags                    = [ "allow-jenkins" ]
image                   = "centos-cloud/centos-7"
#labels                 = ["function","log-server" ]
size                    = "20"
type                    = "pd-standard"
firewall_name           = "jenkins-firewall" 
ports                   = [ "22", "80", "8080" ]
protocol                = "tcp"
source_ranges           = [ "0.0.0.0/0" ]
target_tags             = [ "allow-jenkins" ]
email                   = "lanretemitope7@gmail.com"
#user                   = "lanretemitope7"
