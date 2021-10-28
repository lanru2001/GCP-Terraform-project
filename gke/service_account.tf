# CREATE A CUSTOM SERVICE ACCOUNT TO USE WITH THE GKE CLUSTER
module "gke_service_account" {
  source = "git::git@github.com:gruntwork-io/terraform-google-gke.git//modules/gke-service-account?ref=v0.3.8"

  name        = var.cluster_service_account_name
  project     = var.project
  description = var.cluster_service_account_description
}
