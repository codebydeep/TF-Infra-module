locals {
  name = "${var.name}-${var.environment}"
}

resource "aws_vpc" "my-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.name}-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.name}-public-subnet"
    Tier = "Public"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${local.name}-private-subnet"
    Tier = "Private"
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "${local.name}-igw"
  }
}

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "${local.name}-public-rt"
  }
}

resource "aws_route_table_association" "pub-subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.my-rt.id
}

# helloS