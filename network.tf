resource "aws_subnet" "finalprojectPublicSubnet1" {
  cidr_block              = var.publicsubnet_cidr
  vpc_id                  = aws_vpc.finalproject-VPC.id
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone1
  tags = {
    Name = "${var.servicename}-Monitor_Jenkins"
  }
}

#Private Subnet for Voting App in eu-west-2a
resource "aws_subnet" "Subnet_App1" {
  cidr_block        = var.privatesubnet_cidr1
  vpc_id            = aws_vpc.finalproject-VPC.id
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.servicename}-AppServer-eu-west-2a"
  }
}

#Private Subnet for Redis in eu-west-2a
resource "aws_subnet" "Subnet_Redis1" {
  cidr_block        = var.privatesubnet_cidr2
  vpc_id            = aws_vpc.finalproject-VPC.id
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.servicename}-Redis-eu-west-2a"
  }
}

#Private Subnet for Voting App in eu-west-2b
resource "aws_subnet" "Subnet_App2" {
  cidr_block        = var.privatesubnet_cidr3
  vpc_id            = aws_vpc.finalproject-VPC.id
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.servicename}-AppServer-eu-west-2b"
  }
}

#Private Subnet for Redis in eu-west-2b
resource "aws_subnet" "Subnet_Redis2" {
  cidr_block        = var.privatesubnet_cidr4
  vpc_id            = aws_vpc.finalproject-VPC.id
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.servicename}-Redis-eu-west-2b"
  }
}




