resource "aws_security_group" "webserver_security_group" {
  name        = var.sg_webserver
  description = "Allow Traffic to Web Servers"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["10.1.0.0/16"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["10.1.0.0/16"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.sg_webserver
    },
  )
}

