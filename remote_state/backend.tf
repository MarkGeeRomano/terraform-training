terraform {
  backend "s3" {
    encrypt = true
    bucket = "mark-udemy-remote-state"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}