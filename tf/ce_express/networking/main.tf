module "vpc" {
  source   = "../../modules/aws_vpc/"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_ip_cidr
  tags     = var.tags
}

provider “aws” {
 region = “us-west-2”
 shared_credentials_file = “/Users/tf_user/.aws/creds”
 profile = “customprofile”
}