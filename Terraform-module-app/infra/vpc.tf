resource "aws_vpc" "vpc-main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.vpc-main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-subnet-1"
  }
}

resource "aws_internet_gateway" "inw" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    Name = "${var.env}-inw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.inw.id
  }

  tags = {
    Name = "${var.env}-rt"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.rt.id
}

