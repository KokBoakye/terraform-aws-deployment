terraform {
    backend "s3" {
        bucket = "tf-state-bucket-11-08-2025"
        region = "eu-north-1"
        key    = "terraform-aws-deployment/terraform.tfstate"

    }
}