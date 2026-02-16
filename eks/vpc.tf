# VPC
resource "aws_vpc" "eks-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.my_enviroment}-eks-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name = "${var.my_enviroment}-eks-igw"
  }
}

# Subnets in 3 AZs
resource "aws_subnet" "az1" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.my_enviroment}-eks-subnet-az1"
  }
}

resource "aws_subnet" "az2" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.my_enviroment}-eks-subnet-az2"
  }
}

resource "aws_subnet" "az3" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.my_enviroment}-eks-subnet-az3"
  }
}

# Route Table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.my_enviroment}-eks-rt"
  }
}

# Route Table Associations
resource "aws_route_table_association" "az1" {
  subnet_id      = aws_subnet.az1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "az2" {
  subnet_id      = aws_subnet.az2.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "az3" {
  subnet_id      = aws_subnet.az3.id
  route_table_id = aws_route_table.main.id
}

# Data source for AZs
data "aws_availability_zones" "available" {
  state = "available"
}
