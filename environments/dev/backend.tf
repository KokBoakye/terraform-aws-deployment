terraform {
    backend "s3" {
        bucket = "dev-tf-state-bucket-11-08-2025"
        region = "eu-north-1"
        key    = "dev/terraform.tfstate"

    }
}