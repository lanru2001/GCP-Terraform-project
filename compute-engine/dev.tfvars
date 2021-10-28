project                 = "my-user-project-326713" 
network_name            = "vpc-network-dev"
network                 = "default"
#subnetwork              = "prod"
#subnetwork_project      = "My user project" 
auto_create_subnetworks = true
vm_name                 = "jenkins-dev-server"
machine_type            = "e2-medium"
zone                    = "us-central1-c"
region                  = "us-central1"
tags                    = ["jenkins"]
image                   = "rhel-cloud/rhel-8"
#labels                 = ["function","log-server" ]
size                    = "20"
type                    = "pd-standard"
firewall_name           = "allow-jenkins"
ports                   = [ "22", "80", "8080" ]
protocol                = "tcp"
source_ranges           = [ "10.128.0.0/20" ]
target_tags             = ["jenkins"]
email                   = "lanretemitope7@gmail.com"
user                    = "lanretemitope7"
