resource "aws_vpc" "finalproject-VPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
  tags = {
    Name = "${var.servicename}-VPC"
  }
}
resource "aws_eip" "ElasticIP" {
  vpc = true
  tags = {
    Name = "${var.servicename}-EIP"
  }
}
resource "aws_internet_gateway" "finalproject-IGW" {
  vpc_id = aws_vpc.finalproject-VPC.id
  tags = {
    Name = "${var.servicename}-IGW"
  }
}
resource "aws_nat_gateway" "finalproject-NGW" {
  allocation_id = aws_eip.ElasticIP.id
  subnet_id     = aws_subnet.finalprojectPublicSubnet1.id
}