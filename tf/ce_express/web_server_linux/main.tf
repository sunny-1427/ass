data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../networking/terraform.tfstate"
  }
}

module "web_server" {
  source = "../../modules/aws_asg_server"

  name                      = var.name
  vpc_id                    = data.terraform_remote_state.vpc.outputs.vpc_id
  app_private_subnets       = data.terraform_remote_state.vpc.outputs.private_subnets
  volume_size               = var.volume_size
  tags                      = var.tags
  region                    = var.region
  ami                       = "ami-082b5a644766e0e6f"
  user_data                 = data.template_file.webserver_launch_configuration_user_data.rendered
}

data "template_file" "webserver_launch_configuration_user_data" {
  template = file("${path.module}/template/user_data.tpl")
}
