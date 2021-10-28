terraform {
    backend "gcs" {
        bucket  = "tf-remote-bucket"
        prefix  = "terraform/ce"
    }
}
