provider "google-beta" {

    credentials = "${file("/root/.config/gcloud/application_default_credentials.json")}"
    project = var.project
    region  = var.region
    zone    = var.zone

}
