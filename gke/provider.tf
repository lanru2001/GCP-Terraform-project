provider "google-beta" {

    credentials = "${file("/root/.config/gcloud/application_default_credentials.json")}"
    project = "My user project"
    region = "us-central1"
    zone = "us-central1-c"

}
