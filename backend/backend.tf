terraform {
  backend "s3" {
    bucket         = "us-app-tf-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "us-app-tf-state-lock"
    encrypt        = true
  }
}
