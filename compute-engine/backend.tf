terraform {
    backend "gcs" {
        bucket  = "tf-state-gcs"
        prefix  = "terraform/ce"
    }
}
