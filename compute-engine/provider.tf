provider "google-beta" {

    credentials = "${file("/root/.config/gcloud/application_default_credentials.json")}"
    project = "my-user-project-326713"
    region = "us-central1"
    zone = "us-central1-c"

}
