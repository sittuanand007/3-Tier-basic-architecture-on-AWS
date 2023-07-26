provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "three_tier" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "presentation" {
  vpc_id = aws_vpc.three_tier.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "application" {
  vpc_id = aws_vpc.three_tier.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "data" {
  vpc_id = aws_vpc.three_tier.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_internet_gateway" "three_tier" {
  vpc_id = aws_vpc.three_tier.id
}

resource "aws_nat_gateway" "three_tier" {
  subnet_id = aws_subnet.data.id
  allocation_id = aws_eip.three_tier.id
}

resource "aws_security_group" "presentation" {
  name = "presentation"
  vpc_id = aws_vpc.three_tier.id
  ingress {
    protocol = "tcp"
    port = "80"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "application" {
  name = "application"
  vpc_id = aws_vpc.three_tier.id
  ingress {
    protocol = "tcp"
    port = "80"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol = "tcp"
    port = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "data" {
  name = "data"
  vpc_id = aws_vpc.three_tier.id
  ingress {
    protocol = "tcp"
    port = "3306"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_instance" "three_tier" {
  instance_class = "db.t2.micro"
  engine = "mysql"
  name = "three_tier"
  username = "root"
  password = "password"
  vpc_security_group_ids = [aws_security_group.data.id]
}