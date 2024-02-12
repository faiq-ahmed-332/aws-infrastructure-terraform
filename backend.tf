terraform {
  backend "s3" {
    bucket = "terraform-state"
    key    = "terraform/infrastructure.tfstate"
    region = "ca-central-1"
  }
}