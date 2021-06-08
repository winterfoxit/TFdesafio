resource "aws_vpc" "vpc-desafio02" {
  cidr_block = var.vpc_cidr
  tags = {
    Name : "${var.env_prefix}-vpc-desafio02"
  }
}

resource "aws_subnet" "subnet-desafio02" {
  count             = length(var.subnet_cidr_block)
  vpc_id            = aws_vpc.vpc-desafio02.id
  cidr_block        = element(var.subnet_cidr_block, count.index)
  availability_zone = element(var.az, count.index)
  tags = {
    "Name" = "${var.env_prefix}-subnet-desafio02"
  }
}

resource "aws_internet_gateway" "igw-desafio02" {
  vpc_id = aws_vpc.vpc-desafio02.id
  tags = {
    "Name" = "${var.env_prefix}-igw-desafio02"
  }
}

resource "aws_route_table" "route-table-desafio02" {
  vpc_id = aws_vpc.vpc-desafio02.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-desafio02.id
  }


  tags = {
    "Name" = "${var.env_prefix}-rtb-desafio02"
  }

}

resource "aws_route_table_association" "a-rtb-subnet" {
  count          = length(var.subnet_cidr_block)
  subnet_id      = element(aws_subnet.subnet-desafio02.*.id, count.index)
  route_table_id = aws_route_table.route-table-desafio02.id
}

resource "aws_security_group" "sg_desafio02" {
  name   = "sgdesafio"
  vpc_id = aws_vpc.vpc-desafio02.id

  ingress {
    cidr_blocks = [var.my_ip]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    #cidr_blocks = ["${aws_eip.public_instance.public_ip}"]
    cidr_blocks = ["0.0.0.0/0"] #Block to improve
    from_port   = 3306
    protocol    = "tcp"
    to_port     = 3306
  }

  egress {
    cidr_blocks     = ["0.0.0.0/0"]
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    prefix_list_ids = []
  }

  tags = {
    "Name" = "${var.env_prefix}-sg-desafio02"
  }

}