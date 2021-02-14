resource "aws_route_table" "projectPublicRouteTable" {
  vpc_id = aws_vpc.finalproject-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.finalproject-IGW.id
  }
  tags = {
    Name = "${var.servicename}-Public-RouteTable"
  }

}

resource "aws_route_table_association" "project-Pulic-RT-Association" {
  subnet_id      = aws_subnet.finalprojectPublicSubnet1.id
  route_table_id = aws_route_table.projectPublicRouteTable.id
}

resource "aws_network_interface" "project-NetworkInterface" {
  subnet_id = aws_subnet.finalprojectPublicSubnet1.id
}