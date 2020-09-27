# Sets up a launch configuration using the latest ubuntu 20.04 LTS image

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "app" {
  name            = "web_config"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_http_from_lb.id]
  user_data = templatefile("userdata.tpl", {
    port : var.app_config.port,
    base_url : var.app_config.base_url
  })
}
