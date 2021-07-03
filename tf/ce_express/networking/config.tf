terraform {
  required_version = ">= 0.12"
  backend "local" {
    path = "terraform.tfstate"
  }
}
[config]
region=us-west-2
output=json