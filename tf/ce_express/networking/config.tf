terraform {
  required_version = ">= 0.12"
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "us-west-2"
}
[config]
region=us-west-2
output=json