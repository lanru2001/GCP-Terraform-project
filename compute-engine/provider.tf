provider "google-beta" {

    credentials = "${file("")}"
    project = "vc-dev-1"
    region = "us-central1"
    zone = "us-central1-c"

}
