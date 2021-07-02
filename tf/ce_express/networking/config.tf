terraform {
  required_version = ">= 0.12"
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider “aws” {
 region = “us-west-2”
 shared_credentials_file = “/Users/tf_user/.aws/creds”
 profile = “customprofile”
}
[config]
region=us-west-2
output=json