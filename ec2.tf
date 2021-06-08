data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "webserver" {
  count                       = length(var.subnet_cidr_block)
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  subnet_id                   = element(aws_subnet.subnet-desafio02.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.sg_desafio02.id]
  availability_zone           = element(var.az, count.index)
  associate_public_ip_address = true
  key_name                    = "DevopsWinterfox"

  user_data = file("user_data.sh")

  tags = {
    "Name" = "${var.env_prefix}-ec2-desafio02-${count.index}"
  }
}