data "aws_ami" "ami" {
  owners = ["amazon"]

  filter {
    name   = "description"
    values = ["Amazon Linux 2023 AMI 2023.4.20240416.0 x86_64 HVM kernel-6.1"]
  }
}


resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.ami.id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
}

locals {
  instance_type = "t2.micro"
}

output "ip" {
  value = aws_instance.myec2.public_ip
}
