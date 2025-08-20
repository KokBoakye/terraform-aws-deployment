terraform {
    backend "s3" {
        bucket = "prod-tf-state-bucket-11-08-2025"
        region = "eu-north-1"
        key    = "prod/terraform.tfstate"

    }
}